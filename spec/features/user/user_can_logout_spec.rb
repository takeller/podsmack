require 'rails_helper'

describe 'As a registered user' do
  it 'I can logout' do
    user = create(:user)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth2',
      :uid => user.uid,
      :info => { :name => user.user_name, email: "takeller17@gmail.com" },
      :credentials => { :token => ENV['GOOGLE_API_TOKEN_TAYLOR'] }
      })

    visit '/'
    click_on 'Login/Register'
    click_on 'Login With Google'

    expect(current_path).to eq('/dashboard')
    visit '/dashboard'

    click_on 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content('Logout')
    expect(page).to have_content('Login/Register')
    expect(page).to_not have_content(user.user_name)
  end
end
