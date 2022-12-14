class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_various_user
 protect_from_forgery with: :exception
  
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
  end
 
  def authenticate_various_user
   if request.path.starts_with?('/admin')
    authenticate_admin!
   else
    authenticate_customer!
   end
  end


end
