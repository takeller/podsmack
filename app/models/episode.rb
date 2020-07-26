class Episode
  attr_reader :name, :description, :audio

  def initialize(formatted_episodes)
    @name = formatted_episodes[:name]
    @description = formatted_episodes[:description]
    @audio = formatted_episodes[:audio]
  end

  def self.make_episodes(spotify_uri)
      podcast_service = PodcastService.new
      episode_details = podcast_service.episodes(spotify_uri)
      format_episode_details(episode_details)
  end


  private
  def self.format_episode_details(episode_details)
    episode_details[:episodes][:items][0..4].map do |details|
      {
        :name => details[:name],
        :description => details[:description],
        :audio => details[:audio_preview_url]
      }
    end

  end
end
