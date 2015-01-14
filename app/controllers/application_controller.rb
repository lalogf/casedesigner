class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
  	devise_parameter_sanitizer.for(:sign_up) do |u|
  		u.permit(:firstname, :lastname, :quote, :avatar, :email, :password, :password_confirmation)
  	end
  end

  private
  def validate_user
    redirect_to root_path unless current_user.id.to_s == params[:id]
  end
  def validate_user_id
    redirect_to root_path unless current_user.id.to_s == params[:user_id]
  end



end
