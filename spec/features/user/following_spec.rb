require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit podcast show page' do
    it 'I can follow a podcast only once' do
      user = create(:user)
      podcast = create(:podcast)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/podcasts/#{podcast.id}"

      click_on 'Follow'

      visit '/dashboard'
      expect(page).to have_content(podcast.name)
      visit "/podcasts/#{podcast.id}"
      save_and_open_page
      expect(page).to_not have_button("Follow")
    end
  end
end
