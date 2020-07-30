require 'rails_helper'

describe 'As a registered user' do
  describe 'When I visit my dashboard' do
    it 'I can apply to submit a podcast' do
      user = create(:user)

      create(:tag, name: 'News')
      create(:tag, name: 'True Crime')
      create(:tag, name: 'Politics')

      create(:tag, name: 'Interviews')
      create(:tag, name: 'Music')
      create(:tag, name: 'Software')


      # This needs to be restored once we have the user dashboard/session controller set up.
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      click_on 'Upload your own podcast'

      expect(current_path).to eq(search_path)
      fill_in :podcast_name, with: "Conan O'brien"
      click_on 'Search'
    end
  end
end


      # Remove when above section is restored.
<<<<<<< HEAD
#       visit new_user_podcast_path(user)
=======
      visit new_user_podcast_path(user)

      fill_in 'podcast[name]', with: 'Dissect'
      page.select 'Denver', from: 'podcast[location]'
      check 'News'
      check 'True Crime'
      check 'Politics'
      fill_in 'podcast[twitter]', with: 'www.twitter.com/test'
      fill_in 'podcast[patreon]', with: 'www.patreon.com/test'
      fill_in 'podcast[instagram]', with: 'www.instagram.com/test'
      fill_in 'podcast[facebook]', with: 'www.facebook.com/test'
      fill_in 'podcast[description]', with: 'Favorite albums broken down'
      check 'podcast[adult_content]'
      fill_in 'podcast[podcast_uri]', with: '2b025hq3gJ17tQdxS3aV43'
      fill_in 'podcast[photo]', with: 'https://picsum.photos/200'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')

      podcast = Podcast.last

      expect(podcast.user.user_name).to eq(user.user_name)
      expect(podcast.location).to eq('Denver')
      expect(podcast.podcast_uri).to eq('2b025hq3gJ17tQdxS3aV43')
    end
>>>>>>> master

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

<<<<<<< HEAD
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
=======
      expect(current_path).to eq(new_user_podcast_path(user))
      expect(page).to have_content("Description can't be blank")
    end
    xit 'I can apply to submit a podcast then admin can approve' do
      user = create(:user)
      create(:tag, name: 'Interviews')
      create(:tag, name: 'Music')
      create(:tag, name: 'Software')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_podcast_path(user)

      fill_in 'podcast[name]', with: 'Dissect'
      page.select 'Denver', from: 'podcast[location]'
      check 'Interviews'
      check 'Music'
      check 'Software'
      fill_in 'podcast[twitter]', with: 'www.twitter.com/test'
      fill_in 'podcast[patreon]', with: 'www.patreon.com/test'
      fill_in 'podcast[instagram]', with: 'www.instagram.com/test'
      fill_in 'podcast[facebook]', with: 'www.facebook.com/test'
      fill_in 'podcast[description]', with: 'Favorite albums broken down'
      check 'podcast[adult_content]'
      fill_in 'podcast[podcast_uri]', with: '2b025hq3gJ17tQdxS3aV43'
      fill_in 'podcast[photo]', with: 'https://picsum.photos/200'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')

      @podcast = Podcast.last

      expect(@podcast.user.user_name).to eq(user.user_name)
      expect(@podcast.location).to eq('Denver')
      expect(@podcast.podcast_uri).to eq('2b025hq3gJ17tQdxS3aV43')

      click_on 'Logout'
      expect(current_path).to eq('/')

      @admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      login_user(@admin)
      click_on 'Dashboard'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('.admin-dashboard')

      expect(page).to have_css("#podcast_pending_approval", count: 1)
      expect(page).to have_content(podcast.name)
    end
  end
end
>>>>>>> master
