class DesignsController < ApplicationController
	
	before_filter :set_user, only:[:new, :edit] 
	before_action :set_design, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	# before_action :validate_user_id





	def index
		@design = Design.where(user_id: params[:user_id])
	end

	def show
	end
	
	def new
		@design = Design.new
	end

	def create
		Design.create(design_params.merge(user_id: current_user.id))
		redirect_to new_user_product_path(current_user.id)
	end

	def edit
	end

	def update
		@design.update(design_params)
		redirect_to root_path
	end
	
	def destroy
 		@design.destroy
 		redirect_to root_path		
	end



	private
	def set_design
		@design = Design.find(params[:id])
	end

	def set_user
		@user = User.friendly.find(params[:user_id])
	end

	def design_params
		params.require(:design).permit(:image)
	end

end
