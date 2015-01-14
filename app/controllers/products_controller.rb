class ProductsController < ApplicationController
	before_filter :set_user, only:[:new, :edit, :preview]
	before_filter :getproducts, only:[:new]  
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	# before_action :validate_user_id

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

		Product.create(model: params[:model], case_image: new_file, user_id: current_user.id)
		redirect_to "/users/"+ current_user.id.to_s + "/preview"

	end

	def edit
		
	end
	def update
		@product.update(product_params)
		redirect_to "/users/"+ current_user.id.to_s + "/preview"

	end
	
	def destroy
		@product.destroy
		redirect_to "/users/"+ current_user.id.to_s + "/preview"
	end


	private

		def set_product
			@product = Product.find(params[:id])
		end
		def getproducts
			@prodall = Product.where(user_id: params[:user_id])
		end

		def set_user
			@user = User.friendly.find(params[:user_id])
		end

		def product_params
			params.require(:product).permit(:model, :case_image)
		end
end
