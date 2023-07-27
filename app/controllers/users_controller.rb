require 'faraday'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    @viewing_users = @user.viewing_users
    @host = @viewing_users.where(host: "YES")
    if @user.viewing_parties.count >= 1
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["Authorization"] = ENV["api_access_key"]
      end
      response = conn.get("/3/search/movie/#{@viewing_parties[0].api_movie_id}")
      data = JSON.parse(response.body, symbolize_names: true)
      @movie = PopularMovie.new(data)
    end
  end

  def create
    user = user_params
    user[:username] = user[:username].downcase
    new_user = User.new(user)
    if new_user.save
      redirect_to user_path(new_user.id)
      flash[:success] = "Welcome, #{new_user.username}!"
    else
      redirect_to new_register_path
      flash[:error] = "Sorry, credentials don't match"
    end
  end

  # def login_form

  # end

  # def login
  #   user = User.find_by(username: params[:username])

  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     flash[:success] = "Welcome, #{user.username}!"
  #     redirect_to user_path(user.id)
  #   else
  #     flash[:error] = "Invalid Cridentials"
  #     render :login_form
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :id)
  end
end
