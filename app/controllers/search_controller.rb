class SearchController < ApplicationController
  def index
    if search_params.present?
      search_results = SearchResults.new.podcasts(params[:podcast_name])
      binding.pry
    end
  end

  private
  def search_params
    params.permit(:podcast_name)
  end
end