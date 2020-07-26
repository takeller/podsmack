require 'rails_helper'

RSpec.describe Podcast, type: :model do
  describe 'relationships' do 
    it {should belong_to :user}
    it {should have_many(:tags).through(:podcast_tags)}
    it {should have_many(:podcast_tags).dependent(:destroy)}
  end

  describe 'methods' do
    it 'locates podcasts with active: false ' do 
      @user = create(:user)
      @podcast = create(:podcast, user: @user)
      @podcast2 = create(:podcast, user: @user, active: true)
      
      expect(@user.pending_podcasts.length).to eq(1)
    end
  end
end
