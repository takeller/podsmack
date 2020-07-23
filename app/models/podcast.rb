class Podcast < ApplicationRecord
  belongs_to :user
  has_many :podcast_tags, dependent: :destroy
  has_many :tags, through: :podcast_tags
end
