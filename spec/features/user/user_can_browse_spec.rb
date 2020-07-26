# require 'rails_helper'

# describe 'As a User' do
#   before :each do
#     @user = create(:user)
#     @podcast = create(:podcast, user: @user, location: "Denver")
#     @podcast2 = create(:podcast, user: @user, location: "NYC")
#     @podcast3 = create(:podcast, user: @user, location: "Denver")
  
#     @tag1 = create(:tag, name: 'Interviews')
#     @tag2 = create(:tag, name: 'Music')
#     @tag3 = create(:tag, name: 'Software')
#     @tag4 = create(:tag, name: 'Mystery')
#     @tag5 = create(:tag, name: 'Sports')

#     create(:podcast_tag, podcast_id: @podcast.id, tag_id: @tag1.id)
#     create(:podcast_tag, podcast_id: @podcast2.id, tag_id: @tag2.id) 
#     create(:podcast_tag, podcast_id: @podcast2.id, tag_id: @tag4.id)
#     create(:podcast_tag, podcast_id: @podcast3.id, tag_id: @tag3.id)
#     create(:podcast_tag, podcast_id: @podcast3.id, tag_id: @tag4.id)
#     create(:podcast_tag, podcast_id: @podcast3.id, tag_id: @tag5.id)
    
#     login_user(@user) 

#     visit '/'
#     click_on 'Find your next favorite podcast'

#   end
#   it 'I find podcasts by location' do

#     expect(current_path).to eq('/podcasts')
#     # click_button('Location')
    
#     page.select 'Denver'

#     click_on('Search')

#     expect(page).to have_css('.podcast-browse')
#     expect(page).to have_css("#podcast_results", count: 2)
#   end
# end