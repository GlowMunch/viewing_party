require 'faraday'
class UsersController < ApplicationController
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

  def new

  end

  def create
  end
end


# class Users::RegisterController < ApplicationController
#   def index

#   end

#   def create
#     @user = User.create(name: params[:name], email: params[:email])
#     #make User.new to test if email is unique
#     redirect_to user_path(@user.id)
#   end

#   private
#     def user_params
#       # params.require(:user).permit(:name, :email)
#     end
# end