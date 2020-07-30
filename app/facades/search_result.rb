class SearchResult
  attr_reader :title, :description, :thumbnail, :podcast_id

  def initialize(result_params)
    @title = result_params[:title]
    @description = result_params[:description]
    @thumbnail = result_params[:thumbnail]
    @podcast_id = result_params[:id]
  end

  def self.from_api(search_term)
    results = PodcastService.new.search(search_term)
    results[:data][:results].map do |result|
      SearchResult.new(result)
    end
  end

  def in_database?
    Podcast.exists?(podcast_uri: podcast_id)
  end
end