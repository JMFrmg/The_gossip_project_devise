class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :sanitize_devise_parameters, if: :devise_controller?

  	def sanitize_devise_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :sign_up_code])
  	end

def logged_in?
    !current_user.nil?
  end


  def ensure_login
    return true if logged_in?
    session[:return_to] = request.fullpath
    redirect_to new_user_session_path and return false
  end
end
