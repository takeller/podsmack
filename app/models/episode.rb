class Episode
  attr_reader :title, :description, :audio, :audio_length_sec, :pub_date

  def initialize(formatted_episodes)
    @title = formatted_episodes[:title]
    @description = formatted_episodes[:description]
    @audio = formatted_episodes[:audio]
    @audio_length_sec = formatted_episodes[:audio_length_sec]
    @pub_date = formatted_episodes[:pub_date]
  end

  def self.make_episodes(podcast_uri)
      podcast_service = PodcastService.new
      podcast_details = podcast_service.podcast(podcast_uri)
      format_episode_details(podcast_details[:data][:episodes])
  end


  private
  def self.format_episode_details(episode_details)
    episode_details.map do |details|
      {
        :title => details[:title],
        :description => details[:description],
        :audio => details[:audio],
        :audio_length_sec => details[:audio_length_sec],
        :pub_date => details[:pub_date]
      }
    end
  end
end
