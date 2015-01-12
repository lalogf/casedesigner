class UsersController < ApplicationController

	
	before_action :set_user, only: [:show, :edit, :update, :destroy, :preview, :store]
	before_action :authenticate_user!, only:[:preview]
	before_action :validate_user, only:[:preview]
	

def index
	@users = User.all
end



def show
	# @prod = Product.where(user_id: params[:id])	
	# redirect_to "/users/"+ @user.id.to_s + "/preview"
end
def store
	@prod = Product.where(user_id: params[:id])
end

def edit
end

def update

	@user.update(user_params)
	redirect_to root_path
end

def destroy
	@user.destroy
	redirect_to root_path
end


def preview

		@prod = Product.where(user_id: params[:id])	
		@design = Design.where(user_id: params[:id])
	
		# @prod = Product.where(user_id: current_user.id)
		# @design = Design.where(user_id: current_user.id)

end


private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :quote, :avatar)
    end
    # def ability
    # 	return unless session[:id]
    # 	@current_user ||= User.find(session[:id]) 
    # end




end




