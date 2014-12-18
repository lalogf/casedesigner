class UsersController < ApplicationController

	
	before_action :set_user, only: [:show, :edit, :update, :destroy]

def index
	@users = User.all
end



def show
	@prod = Product.where(user_id: params[:id])	
end

def new
	@user = User.new
end

def create
	@user = User.new(user_params)

      if @user.save
        UserMailer.welcome_email(@user).deliver
		redirect_to "/"
      else
		render :new 
      end

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


private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :quote, :avatar)
    end


end




