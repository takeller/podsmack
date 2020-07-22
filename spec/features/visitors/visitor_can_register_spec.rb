require 'rails_helper'

describe 'visitor can create an account' do
  it 'can create account from registration page' do
    name = 'user1'
    password = 'password'
    password_confirmation = 'password'

    visit new_user_path

    fill_in :name,  with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button "Submit"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content('Successfully registered and logged in')
  end
end