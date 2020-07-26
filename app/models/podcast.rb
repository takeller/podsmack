class Podcast < ApplicationRecord
  belongs_to :user
  has_many :podcast_tags, dependent: :destroy
  has_many :tags, through: :podcast_tags
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :description

  def make_episodes
    podcast_service = PodcastService.new
    episode_details = podcast_service.episodes(spotify_uri)

  end
end
