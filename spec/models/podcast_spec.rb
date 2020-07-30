require 'rails_helper'

RSpec.describe Podcast, type: :model do
  describe 'relationships' do 
    it {should belong_to :user}
    it {should have_many(:tags).through(:podcast_tags)}
    it {should have_many(:podcast_tags).dependent(:destroy)}
  end

  describe 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :location}
    it {should validate_presence_of :description}
    it {should validate_presence_of :podcast_uri}
    it {should validate_uniqueness_of :podcast_uri}
  end

  describe 'methods' do
    it 'locates podcasts with active: false ' do 
      @user = create(:user)
      @podcast = create(:podcast, user: @user)
      @podcast2 = create(:podcast, user: @user, podcast_uri: '123', active: true)
      
      expect(@user.pending_podcasts.length).to eq(1)
    end
  end
end
