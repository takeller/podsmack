require 'rails_helper'

describe 'visitor can create an account' do
  it 'can create account from registration page' do
    visit new_user_path

    fill_in 'user[user_name]',  with: 'user1'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button "Submit"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content('Successfully registered and logged in')
  end
end