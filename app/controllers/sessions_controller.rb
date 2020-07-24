class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    flash[:success] = "Welcome #{user.user_name}"

    redirect_to '/dashboard'
  end
end
