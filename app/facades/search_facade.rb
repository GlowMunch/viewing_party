class SearchFacade
  def get_movie(movie)
    service = MovieService.new
    request = service.movie_search(movie)
    films = request[:results].map do |film|
      PopularMovie.new(film)
    end
  end
end