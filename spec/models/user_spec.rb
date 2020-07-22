require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:user_name)}
    it {should validate_presence_of(:password_digest)}
  end

  describe 'relationships' do
    it {should have_many(:podcasts).through(:followings)}
    it { should have_many(:followings)}
  end
end
