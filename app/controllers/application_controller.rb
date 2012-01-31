class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :logged_in?, :current_user

  private
  def logged_in?
    session[:user_id].present?
  end
  
  def current_user
    User.find(session[:user_id]) || nil
  end
end
