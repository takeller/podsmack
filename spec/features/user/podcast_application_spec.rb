require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit my dashboard' do
    it 'I can apply to submit a podcast', :vcr do
      user = create(:user)

      create(:tag, name: 'News')
      create(:tag, name: 'True Crime')
      create(:tag, name: 'Politics')

      create(:tag, name: 'Interviews')
      create(:tag, name: 'Music')
      create(:tag, name: 'Software')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      click_on 'Upload your own podcast'

      expect(current_path).to eq(search_path)
      fill_in :podcast_name, with: "Conan"
      click_on 'Search'
      expect(current_path).to eq(search_path)
      expect(page).to have_css('.search-result', count: 10)
      
      within first('.search-result') do
        page.select 'Denver', from: 'Location'
        check 'Interviews'
        check 'True Crime'
        check 'Politics'
        fill_in :twitter, with: 'www.twitter.com/test'
        fill_in :patreon, with: 'www.patreon.com/test'
        fill_in :instagram, with: 'www.instagram.com/test'
        fill_in :facebook, with: 'www.facebook.com/test'
        check :adult_content

        click_on 'Submit'
      end
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Podcast submitted and waiting approval')

      podcast = Podcast.last
      expect(podcast.name).to eq ("Conan O’Brien Needs A Friend")
      expect(podcast.user).to eq(user)
      expect(podcast.location).to eq('Denver')
      expect(podcast.twitter).to eq('www.twitter.com/test')
      expect(podcast.patreon).to eq('www.patreon.com/test')
      expect(podcast.instagram).to eq('www.instagram.com/test')
      expect(podcast.facebook).to eq('www.facebook.com/test')
    end

    it 'I can not apply to submit a podcast that already exists', :vcr do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      click_on 'Upload your own podcast'

      expect(current_path).to eq(search_path)
      fill_in :podcast_name, with: "Conan"
      click_on 'Search'
      expect(current_path).to eq(search_path)
      expect(page).to have_css('.search-result', count: 10)
      
      within first('.search-result') do
        page.select 'Denver', from: 'Location'
        check :adult_content

        click_on 'Submit'
      end
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Podcast submitted and waiting approval')
      click_on 'Upload your own podcast'

      expect(current_path).to eq(search_path)
      fill_in :podcast_name, with: "Conan"
      click_on 'Search'
      expect(current_path).to eq(search_path)
      
      within first('.search-result') do
        expect(page).to have_content('This podcast has already been submitted by a user')        
      end
    end

    it 'I can apply to submit a podcast then admin can approve', :vcr do
      user = create(:user)
      create(:tag, name: 'Interviews')
      create(:tag, name: 'Music')
      create(:tag, name: 'Software')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
      visit '/dashboard'

      click_on 'Upload your own podcast'

      expect(current_path).to eq(search_path)
      fill_in :podcast_name, with: "Conan"
      click_on 'Search'
      expect(current_path).to eq(search_path)
      expect(page).to have_css('.search-result', count: 10)
      
      within first('.search-result') do
        page.select 'Denver', from: 'Location'
        check :adult_content

        click_on 'Submit'
      end

      expect(current_path).to eq('/dashboard')

      podcast = Podcast.last

      expect(podcast.user).to eq(user)
      expect(podcast.location).to eq('Denver')

      click_on 'Logout'
      expect(current_path).to eq('/')
      
      admin = create(:admin)
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      login_user(admin)
      click_on 'Dashboard'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('.admin-dashboard')
      
      expect(page).to have_css("#podcast_pending_approval", count: 1)
      expect(page).to have_content(podcast.name)
    end
  end
end
