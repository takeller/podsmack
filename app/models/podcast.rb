class Podcast < ApplicationRecord
  belongs_to :user
  has_many :podcast_tags, dependent: :destroy
  has_many :tags, through: :podcast_tags
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :description

  scope :filter_by_location, -> (location) {where location: location}
  scope :filter_by_adult_content, -> (adult_content) {where adult_content: adult_content}
  
end
