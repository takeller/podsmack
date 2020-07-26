require 'rails_helper'

describe 'As a User' do
  before :each do
    @user = create(:user)
    @podcast = create(:podcast, user: @user, location: "Denver")
    @podcast2 = create(:podcast, user: @user, location: "New York")
    @podcast3 = create(:podcast, user: @user, location: "Denver")
  
    create(:tag, name: 'Interviews')
    create(:tag, name: 'Music')
    create(:tag, name: 'Software')
    create(:tag, name: 'Mystery')
    create(:tag, name: 'Sports')

    login_user

    visit '/'
    click_on 'Login/Register'

    click_on 'Login With Google'

  end
  it 'I visit the admin dashboard and see admin dashboard attributes' do

    expect(current_path).to eq('/dashboard')
    expect(page).to have_css('.admin-dashboard')
    expect(page).to have_css("#podcast_pending_approval", count: 3)
  end
end