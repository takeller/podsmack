require 'rails_helper'

describe 'As an Admin' do
  it 'I visit the admin dashboard and see admin dashboard attributes' do
    admin = create(:admin)
    podcast = create(:podcast, user: admin)
    podcast2 = create(:podcast, user: admin)
    podcast3 = create(:podcast, user: admin)

    login_user(admin)

    visit '/'
    click_on 'Login/Register'

    click_on 'Login With Google'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_css('.admin-dashboard')
    # Podcasts pending approval
    expect(page).to have_css("#podcast_pending_approval", count: 3)
  end
end