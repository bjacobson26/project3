class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception (sequencing of callbacks) 

  helper_method :current_user
  #figure out if current user logged in user is a site admin
  helper_method :current_user_admin
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def current_user_admin
    if current_user != nil && current_user.admin == true
  	   current_user_admin
    else
      return false #returns false for the purpose of creating a new user when no one is logged in
    end
  end
end
