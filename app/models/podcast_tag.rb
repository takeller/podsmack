class PodcastTag < ApplicationRecord
  belongs_to :podcast
  belongs_to :tag
end
