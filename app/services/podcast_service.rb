class PodcastService
  def podcast(podcast_id)
    get_json("/podcast/#{podcast_id}")
  end

  def search(search_term)
    get_json("/search?podcast_name=#{search_term}")
  end

private

  def conn
    Faraday.new(url: 'http://localhost:9292')
  end

  def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end
end
