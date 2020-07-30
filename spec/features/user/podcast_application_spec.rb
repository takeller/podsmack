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
  end
end

    # it 'I can not submit a podcast with a blank location', :vcr do
    #   user = create(:user)

    #   create(:tag, name: 'News')
    #   create(:tag, name: 'True Crime')
    #   create(:tag, name: 'Politics')

    #   create(:tag, name: 'Interviews')
    #   create(:tag, name: 'Music')
    #   create(:tag, name: 'Software')

#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#       visit '/dashboard'

#       click_on 'Upload your own podcast'

#       expect(current_path).to eq(search_path)
#       fill_in :podcast_name, with: "Conan"
#       click_on 'Search'
#       expect(current_path).to eq(search_path)
#       expect(page).to have_css('.search-result', count: 10)
      
#       within first('.search-result') do
#         check 'Politics'
#         fill_in :twitter, with: 'www.twitter.com/test'
#         fill_in :patreon, with: 'www.patreon.com/test'
#         fill_in :instagram, with: 'www.instagram.com/test'
#         fill_in :facebook, with: 'www.facebook.com/test'
#         check :adult_content

#         click_on 'Submit'
#       end
#       save_and_open_page
#       expect(current_path).to eq(search_path)
#       expect(page).to have_content("Location can't be blank")
#     end
#   end
# end


      # Remove when above section is restored.
#       visit new_user_podcast_path(user)

#       fill_in 'podcast[name]', with: 'Dissect'
#       page.select 'Denver', from: 'podcast[location]'
#       check 'News'
#       check 'True Crime'
#       check 'Politics'
#       fill_in 'podcast[twitter]', with: 'www.twitter.com/test'
#       fill_in 'podcast[patreon]', with: 'www.patreon.com/test'
#       fill_in 'podcast[instagram]', with: 'www.instagram.com/test'
#       fill_in 'podcast[facebook]', with: 'www.facebook.com/test'
#       fill_in 'podcast[description]', with: 'Favorite albums broken down'
#       check 'podcast[adult_content]'
#       fill_in 'podcast[spotify_uri]', with: '2b025hq3gJ17tQdxS3aV43'
#       fill_in 'podcast[photo]', with: 'https://picsum.photos/200'

#       click_on 'Submit'

#       expect(current_path).to eq('/dashboard')

#       podcast = Podcast.last

#       expect(podcast.user.user_name).to eq(user.user_name)
#       expect(podcast.location).to eq('Denver')
#       expect(podcast.spotify_uri).to eq('2b025hq3gJ17tQdxS3aV43')
#     end

#     it 'Sad: podcast must have a podcast name' do
#       user = create(:user)

#       visit new_user_podcast_path(user)

#       page.select 'Denver', from: 'podcast[location]'
#       fill_in 'podcast[description]', with: 'Favorite albums broken down'

#       click_on 'Submit'

#       expect(current_path).to eq(new_user_podcast_path(user))
#       expect(page).to have_content("Name can't be blank")
#     end

#     it 'Sad: podcast must have a location' do
#       user = create(:user)

#       visit new_user_podcast_path(user)

#       fill_in 'podcast[name]', with: 'Dissect'
#       fill_in 'podcast[description]', with: 'Favorite albums broken down'

#       click_on 'Submit'

#       expect(current_path).to eq(new_user_podcast_path(user))
#       expect(page).to have_content("Location can't be blank")
#     end

#     it 'Sad: podcast must have a description' do
#       user = create(:user)

#       visit new_user_podcast_path(user)

#       fill_in 'podcast[name]', with: 'Dissect'
#       page.select 'Denver', from: 'podcast[location]'

#       click_on 'Submit'

#       expect(current_path).to eq(new_user_podcast_path(user))
#       expect(page).to have_content("Description can't be blank")
#     end
#     xit 'I can apply to submit a podcast then admin can approve' do
#       user = create(:user)
#       create(:tag, name: 'Interviews')
#       create(:tag, name: 'Music')
#       create(:tag, name: 'Software')
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
#       visit new_user_podcast_path(user)

#       fill_in 'podcast[name]', with: 'Dissect'
#       page.select 'Denver', from: 'podcast[location]'
#       check 'Interviews'
#       check 'Music'
#       check 'Software'
#       fill_in 'podcast[twitter]', with: 'www.twitter.com/test'
#       fill_in 'podcast[patreon]', with: 'www.patreon.com/test'
#       fill_in 'podcast[instagram]', with: 'www.instagram.com/test'
#       fill_in 'podcast[facebook]', with: 'www.facebook.com/test'
#       fill_in 'podcast[description]', with: 'Favorite albums broken down'
#       check 'podcast[adult_content]'
#       fill_in 'podcast[spotify_uri]', with: '2b025hq3gJ17tQdxS3aV43'
#       fill_in 'podcast[photo]', with: 'https://picsum.photos/200'

#       click_on 'Submit'

#       expect(current_path).to eq('/dashboard')

#       @podcast = Podcast.last

#       expect(@podcast.user.user_name).to eq(user.user_name)
#       expect(@podcast.location).to eq('Denver')
#       expect(@podcast.spotify_uri).to eq('2b025hq3gJ17tQdxS3aV43')

#       click_on 'Logout'
#       expect(current_path).to eq('/')
      
#       @admin = create(:admin)
      
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
#       login_user(@admin)
#       click_on 'Dashboard'

#       expect(current_path).to eq('/dashboard')
#       expect(page).to have_css('.admin-dashboard')
      
#       expect(page).to have_css("#podcast_pending_approval", count: 1)
#       expect(page).to have_content(podcast.name)
#     end
#   end
# end
