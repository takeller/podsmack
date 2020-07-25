require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:user_name)}
  end

  describe 'relationships' do
    it {should have_many(:following_podcasts).through(:followings)}
    it { should have_many(:followings)}
  end
end
