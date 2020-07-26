class PodcastFacade
  attr_reader :podcast
  def initialize(podcast_info)
    @podcast = podcast_info
  end

  def social_media
    handles = {
                'twitter' => @podcast[:twitter],
                'facebook' => @podcast[:facebook],
                'patreon' =>  @podcast[:patreon],
                'instagram' => @podcast[:instagram]
              }
    find = handles.find_all{ |k, v| v.nil? == false}
    find.to_h
  end

  def episodes
    @podcast.make_episodes #we want an array of episode name, description,  audio preview url
    require "pry"; binding.pry
  end

end