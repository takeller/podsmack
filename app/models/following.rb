class Following < ApplicationRecord
  belongs_to :favorite_podcast, foreign_key: 'podcast_id', class_name: 'Podcast'
  belongs_to :user
end
