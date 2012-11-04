require 'spec_helper'

describe Movie do
  describe "#find_similar_movies" do
    before (:each) { 
      movies = [
        { title: "Blade Runner", rating: "PG", director: "Ridley Scott", release_date: "1982-06-25" },
        { title: "Alien", rating: "R", director: "", release_date: "1979-05-25" },
        { title: "THX-1138", rating: "R", director: "George Lucas", release_date: "1971-03-11" }
      ]
      movies.each do |movie|
        Movie.create(movie)
      end
      @movie = create(:movie)
    }

    it "should return other movies with same director" do
      movies = @movie.find_similar_movies
      movies.count.should be 1
      movies.first.title.should match "THX-1138"
    end
  end
end
