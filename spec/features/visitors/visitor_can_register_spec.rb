require 'rails_helper'

describe 'visitor can create an account' do
  it 'can create account from registration page' do
    visit new_user_path

    page.fill_in 'user[user_name]',  with: 'user1'
    page.fill_in 'user[password]', with: 'password'
    page.fill_in 'user[password_confirmation]', with: 'password'
    click_button "Submit"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Successfully registered and logged in')
  end

  it 'will not create a user when there are errors in the registration' do
    visit new_user_path

    page.fill_in 'user[user_name]',  with: ''
    page.fill_in 'user[password]', with: 'password'
    page.fill_in 'user[password_confirmation]', with: 'password'
    click_button "Submit"

    expect(page).to have_content("User name can't be blank")

    page.fill_in 'user[user_name]',  with: 'user1'
    page.fill_in 'user[password]', with: 'password'
    page.fill_in 'user[password]', with: 'passwor'
    click_button "Submit"

    expect(page).to have_content("Password confirmation doesn't match Password")

    page.fill_in 'user[user_name]',  with: 'user1'
    page.fill_in 'user[password]', with: 'password'
    page.fill_in 'user[password_confirmation]', with: 'password'
    click_button "Submit"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Successfully registered and logged in')
  end
end