class ProductsController < ApplicationController
	before_filter :set_user, only:[:new, :edit] 
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
		
	end
	def show
		
	end
	def new
		@product = Product.new
		@designs = Design.where(user_id: params[:user_id])		
	end

	def create
		file_name = SecureRandom.hex

		base_64_string = params[:newcaseimage].split('data:image/png;base64,')[1]

		File.open(file_name + '.png', 'wb') do |f|
			f.write(Base64.decode64(base_64_string))
		end

		new_file = File.open(file_name + '.png')

		Product.create(model: params[:model], case_image: new_file, user_id: params[:user_id])
		redirect_to "/"

	end

	def edit
		
	end
	def update
		
	end
	def destroy
		
	end


	private

		def set_product
			@product = Product.find(params[:id])
		end

		def set_user
			@user = User.find(params[:user_id])
		end

		def product_params
			params.require(:design).permit(:model, :case_image)
		end
end
