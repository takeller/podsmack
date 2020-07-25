require 'rails_helper'

describe 'User logged in viewing dashboard' do
  it 'A logged in user visits /dashboard and sees dashboard attributes' do
    @user = create(:user, password: 'password')

    visit '/'

    click_on "login"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(@user.email)
    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.last_name)

    expect(page).to have_css(".favorite", count:2)
    expect(page).to have_content("Favorites")
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("Podcast Application")
  end
end