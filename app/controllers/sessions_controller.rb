require "faraday"
class SessionsController < ApplicationController

  #login form
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      if user.admin?
        redirect_to admin_dashboard_path
      elsif user.manager?
        redirect_to root_path
      elsif
        redirect_to user_path(user.id)
      end
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  def destroy
    reset_session
    flash[:message] = "You have been logged out."
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end