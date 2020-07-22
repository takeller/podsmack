require 'rails_helper'

RSpec.describe PodcastTag, type: :model do
  it {should belong_to :podcast}
  it {should belong_to :tag}
end
