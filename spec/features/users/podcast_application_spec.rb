require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit my dashboard' do
    it 'I can apply to submit a podcast' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      click_on 'Podcast Application'

      expect(current_path).to eq('/application/new')

      fill_in 'name', with: user.name
      # Select from dropdown
      fill_in 'location', with: 'Denver'
      fill_in 'twitter', with: 'www.twitter.com/test'
      fill_in 'patreon', with: 'www.patreon.com/test'
      fill_in 'instagram', with: 'www.instagram.com/test'
      fill_in 'facebook', with: 'www.facebook.com/test'
      fill_in 'description', with: 'Favorite albums broken down'
      # Checkbox
      fill_in 'adult', with: 'true'
      fill_in 'spotify', with: '2b025hq3gJ17tQdxS3aV43'
      fill_in 'photo', with: 'https://picsum.photos/200'

      click_in 'Submit'

      expect(current_path).to eq('/dashboard')

      application = Application.last

      expect(application.name).to eq(user.name)
      expect(application.location).to eq('Denver')
      expect(application.show_id).to eq('2b025hq3gJ17tQdxS3aV43')
    end
  end
end
