class ApplicationController < ActionController::Base
    
    before_action :set_locale
    
    before_action :configure_permitted_parameters, if: :devise_controller?

rescue_from CanCan::AccessDenied do |exception|
   flash[:error] = exception.message
    redirect_back fallback_location: root_url
end

protected

def configure_permitted_parameters
   added_attrs = %i(username)
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
end

private

def set_locale
   I18n.locale = :fr 
end
    
end
