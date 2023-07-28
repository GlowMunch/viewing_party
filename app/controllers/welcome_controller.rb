class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    unless cookies[:greeting]
      cookies[:greeting] = "HELLO"
    end
  end
end