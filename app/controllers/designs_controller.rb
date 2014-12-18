class DesignsController < ApplicationController
	
	before_filter :set_user, only:[:new, :edit] 
	before_action :set_design, only: [:show, :edit, :update, :destroy]



	def index
		@design = Design.where(user_id: params[:user_id])
	end

	def show

	end
	
	def new
		@design = Design.new
	end

	def create
		Design.create(design_params.merge(user_id: params[:user_id]))
		redirect_to user_designs_path
	end

	def destroy
		
	end
	
	def edit
		
	end
	
	def update
		
	end




	private
	def set_design
		@design = Design.find(params[:id])
	end

	def set_user
		@user = User.find(params[:user_id])
	end

	def design_params
		params.require(:design).permit(:description, :image)
	end

end
