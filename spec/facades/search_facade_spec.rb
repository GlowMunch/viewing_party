require "rails_helper"

RSpec.describe SearchFacade do
  describe 'class methods' do
    it "searches for movie and returns overview details" do

      stub_request(:get, "https://api.themoviedb.org/3/movie/search?api_key=615249dd5a14994e607e2d5bc668a81f&query=Sandlot")
        .to_return(body: file_fixture("movies_search.json").read)

      movie = SearchFacade.new.get_movie("Sandlot")

      movie.each do |details|
        expect(details).to be_a(PopularMovie)
        expect(details.title).to be_a(String)
        expect(details.overview).to be_a(String)
        expect(details.vote_average).to be_a(Float)
      end
    end

    it "can return movie cast details" do
      stub_request(:get, "https://api.themoviedb.org/3/movie/api_key=615249dd5a14994e607e2d5bc668a81f&query=Sandlot")
      .to_return(body: file_fixture("sandlot_cast.json").read)


    end
  end
end