class SessionsController < ApplicationController
  before_filter :require_login, :except => :create

  def create
    user = User.find_or_create_by_auth_hash(auth_hash)
    if user.present? && user.member?(Settings.github.organization)
      session[:user_id] = user.id
      redirect_to :root, :notice => 'Logged in!'
    else
      redirect_to :root, :alert => 'Login failed!'
    end
  end

  def destroy
    session.clear
    redirect_to :root, :notice => 'Logged out!'
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
