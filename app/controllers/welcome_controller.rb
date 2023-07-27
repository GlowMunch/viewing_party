class WelcomeController < ApplicationController
  def index
    # @users = User.all
    unless cookies[:greeting]
      cookies[:greeting] = "HELLO"
    end
  end
end