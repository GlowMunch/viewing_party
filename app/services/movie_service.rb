class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_key']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # def movie_id(movie)
  #   self.movie_search(movie)

  # end

  def movie_search(movie)
    get_url("/3/movie/search?query=#{movie}")
  end

  def movie_details(movie_id)
  end

  def movie_cast(movie_id)
  end

end
