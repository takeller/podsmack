require 'rails_helper'

RSpec.describe Producer, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:password_digest)}
  end
end
