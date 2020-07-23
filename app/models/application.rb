class Application < ApplicationRecord
  validates_presence_of :podcast_name
  validates_presence_of :location 
  validates_presence_of :description
  belongs_to :user
end
