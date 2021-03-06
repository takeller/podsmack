require 'rails_helper'

describe 'User logged in viewing dashboard' do
  it 'A logged in user visits /dashboard and sees dashboard attributes' do
    @user = create(:user)
    @podcast = create(:podcast, user: @user)
    @following = create(:following, user: @user, podcast: @podcast)
    @following2 = create(:following, user: @user, podcast: @podcast)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    # expect(page).to have_content(@user.email)
    expect(page).to have_content(@user.user_name)

    expect(page).to have_css("#follow", count: 2)
    expect(page).to have_content("Following")
    expect(page).to have_content("Edit Profile")
    expect(page).to have_button("Upload your own podcast")
  end
  it "an unregistered user get redirected if they try to visit dashboard" do
    visit '/dashboard'
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login/Register")
  end
end
