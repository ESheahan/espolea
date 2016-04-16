class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def set_locale
    I18n.locale = session[:locale] || 'es'
  end
  
  def after_sign_in_path_for(resource)
      "/profile/#{current_user().id}"
  end
  
  def set_english
    session[:locale] = 'en'
    I18n.locale = 'en'
    redirect_to request.referer
  end  
  
  def set_spanish
    session[:locale] = 'es'
    I18n.locale = 'es'
    redirect_to request.referer
  end 
  
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) do |u|
     u.permit(:first_name, :last_name, :gender, :birthdate, :email, :password, :password_confirmation)
   end
    devise_parameter_sanitizer.for(:edit) do |u|
      u.permit(:first_name, :last_name, :gender, :birthdate, :email, :password, :password_confirmation, :current_password)
   end
  end
end
