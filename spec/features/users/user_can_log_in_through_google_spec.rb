require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the login page' do
    it 'I see a link to log in with google' do
      visit '/login'

      expect(page).to have_link('Login With Google')
    end

    it 'I can create an account through google' do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider => 'google_oauth2',
        :uid => ENV['TAYLOR_UID'],
        :info => { :name => "Taylor Keller" email: "takeller17@gmail.com" },
        :credentials => { :token => ENV['GOOGLE_API_TOKEN_TAYLOR'] }
        })

      visit '/login'

      click_on 'Login With Google'

      user = User.last

      expect(user.name).to eq('Taylor Keller')
      expect(user.uid).to eq(ENV['TAYLOR_UID'])
      expect(user.email).to eq('takeller17@gmail.com')
      expect(user.token).to eq(ENV['GOOGLE_API_TOKEN_TAYLOR'])
    end

    it 'I create a session after loging in with google' do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider => 'google_oauth2',
        :uid => ENV['TAYLOR_UID'],
        :info => { :name => "Taylor Keller" email: "takeller17@gmail.com" },
        :credentials => { :token => ENV['GOOGLE_API_TOKEN_TAYLOR'] }
        })

      visit '/login'

      click_on 'Login With Google'

      expect(current_page).to eq('/dashboard')
      expect(page).to have_content('Welcome Taylor Keller')
    end
  end
end
