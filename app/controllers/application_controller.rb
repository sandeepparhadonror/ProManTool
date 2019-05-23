class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	before_action :authenticate_user!

  before_action :set_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_user
  	@user = current_user if user_signed_in?	
  end
 	

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
