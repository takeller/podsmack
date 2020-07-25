require 'rails_helper'

describe 'As an Admin' do
  before :each do
    @admin = create(:admin)
    @podcast = create(:podcast, user: @admin)
    @podcast2 = create(:podcast, user: @admin)
    @podcast3 = create(:podcast, user: @admin)
    login_user(@admin)

    visit '/'
    click_on 'Login/Register'

    click_on 'Login With Google'

  end
  it 'I visit the admin dashboard and see admin dashboard attributes' do

    expect(current_path).to eq('/dashboard')
    expect(page).to have_css('.admin-dashboard')
    expect(page).to have_css("#podcast_pending_approval", count: 3)
  end

  it "An admin can approve pending podcasts" do 

    within(first("#podcast_pending_approval")) do
      expect(page).to have_button("Approve")
      expect(page).to have_content(@podcast.name)
      expect(page).to have_content(@podcast.description)
    end

    click_on("Approve")

    expect(page).to have_content("Application approved")
    expect(current_path).to eq('/dashboard')
    
  end

end