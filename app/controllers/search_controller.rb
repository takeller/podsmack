class SearchController < ApplicationController
  def index
    if search_params.present?
      @search_results = SearchResult.from_api(search_params[:podcast_name])
    else
      @search_results = []
    end
  end

  private
  def search_params
    params.permit(:podcast_name)
  end
end