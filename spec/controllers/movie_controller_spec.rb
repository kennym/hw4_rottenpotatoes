require 'spec_helper'

describe MoviesController do
  describe "similar movies action" do
    before (:each) { @movie = create(:movie) }

    it "should call the method that return similar movies on model" do
      Movie.any_instance.should_receive(:find_similar_movies)
      get :similar, {:id => @movie.id}
    end

    it "should redirect to '/' when there are no similar movies" do
      @movie = create(:movie, director: "")
      get :similar, {:id => @movie.id}
      response.code.should == "302"
      response.should redirect_to("/")
    end
  end
end
