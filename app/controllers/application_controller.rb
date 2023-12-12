class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :role_ids])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :role_ids])
  end

  def check_user
    
    binding.pry
    
    unless current_user.has_role?(:HR)
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end   
  end
end
