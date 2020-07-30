class PodcastService
  def podcast(podcast_id)
    get_json("/podcast/#{podcast_id}")
  end

private

  def conn
    Faraday.new(url: 'https://podsmack-microservice.herokuapp.com')
  end

  def get_json(uri)
    Rails.cache.fetch(uri) do
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end 
  end
end
