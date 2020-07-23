require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit my dashboard' do
    it 'I can apply to submit a podcast' do
      user = create(:user, password: 'password')
      create(:tag, name: 'Interviews')
      create(:tag, name: 'Music')
      create(:tag, name: 'Software')

      # This needs to be restored once we have the user dashboard/session controller set up.
      #
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      #
      # visit '/dashboard'
      #
      # click_on 'Podcast Application'
      #
      # expect(current_path).to eq('/application/new')

      # Remove when above section is restored. 
      visit new_user_application_path(user)

      fill_in 'application[podcast_name]', with: 'Dissect'
      page.select 'Denver', from: 'application[location]'
      check 'Interviews'
      check 'Music'
      check 'Software'
      fill_in 'application[twitter]', with: 'www.twitter.com/test'
      fill_in 'application[patreon]', with: 'www.patreon.com/test'
      fill_in 'application[instagram]', with: 'www.instagram.com/test'
      fill_in 'application[facebook]', with: 'www.facebook.com/test'
      fill_in 'application[description]', with: 'Favorite albums broken down'
      check 'application[adult_content]'
      fill_in 'application[spotify_uri]', with: '2b025hq3gJ17tQdxS3aV43'
      fill_in 'application[photo]', with: 'https://picsum.photos/200'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')

      application = Application.last

      expect(application.user.user_name).to eq(user.user_name)
      expect(application.location).to eq('Denver')
      expect(application.spotify_uri).to eq('2b025hq3gJ17tQdxS3aV43')
    end
  end
end
