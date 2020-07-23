require 'rails_helper'

RSpec.describe Podcast, type: :model do
  it {should belong_to :producer}
  it {should have_many(:tags).through(:podcast_tags)}
  it {should have_many(:podcast_tags).dependent(:destroy)}
end
