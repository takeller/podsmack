require 'rails_helper'

RSpec.describe "Podsmack Home Page" do
  describe "General introduction" do
    it "Shows homepage " do

      visit '/'

      expect(page).to have_content('Podsmack')
      expect(page).to have_css("img[src*='giphy']")
      expect(page).to have_link("Home")
      expect(page).to have_link("Dashboard")
      expect(page).to have_link("Browse")
      expect(page).to have_link("Login")
      expect(page).to have_link("Register")
    end

  end
end