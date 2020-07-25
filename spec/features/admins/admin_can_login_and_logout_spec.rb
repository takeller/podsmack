require 'rails_helper'

describe 'As an Admin' do
  xit 'I can login through google oauth' do
    admin = create(:admin)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth2',
      :uid => admin.uid,
      :info => { :name => admin.user_name, email: "takeller17@gmail.com" },
      :credentials => { :token => ENV['GOOGLE_API_TOKEN_TAYLOR'] }
      })

    visit '/'
    click_on 'Login/Register'

    click_on '/Login With Google'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_css('.admin-dashboard')
  end

  xit 'I can logout' do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/dashboard'

    click_on 'Logout'
    expect(current_path).to eq(root_path)
    expect(page).to_not have_content('Logout')
    expect(page).to have_content('Login')
    expect(page).to_not have_content(admin.user_name)
  end
end
