require 'rails_helper'

RSpec.describe "Podsmack Home Page" do
  describe "General introduction" do
    it "Shows homepage " do

      visit '/'

      expect(page).to have_content('Podsmack')
      expect(page).to have_css("img[src*='giphy']")
      expect(page).to have_link("Podsmack")
      expect(page).to have_link("Dashboard")
      expect(page).to have_link("Browse")
      expect(page).to have_link("Login")
      expect(page).to have_link("Register")
    end

    it "Podsmack button takes you to home page" do 
      visit "/"

      click_on('Find your next favorite podcast')
      expect(current_path).to eq('/podcasts')
      click_on('Podsmack')
      expect(current_path).to eq('/')
    end

  end
end