class SessionsController < ApplicationController
  def create
    user = User.find_or_create_with_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to hashtags_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
