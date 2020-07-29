class SearchController < ApplicationController
  def index
    search_results = SearchResults.from_api
    
  end

  private
  def search_params
    params.permit(:podcast_name)
  end
end