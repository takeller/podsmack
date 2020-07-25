require 'rails_helper'

describe 'As a registered user' do
  it 'I can logout' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    click_on 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content('Logout')
    expect(page).to have_content('Login')
    expect(page).to_not have_content(user.user_name)
  end
end
