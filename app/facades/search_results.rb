class SearchResults
  attr_reader :title, :description, :thumbnail, :podcast_id

  def self.from_api(search_term)
    results = PodcastService.new.search(search_term)
    results[:data][:results].each do

    end
  end
end