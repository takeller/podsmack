require 'rails_helper'

RSpec.describe "Podsmack Home Page" do
  describe "General introduction" do
    it "Shows homepage for unregistered guest" do

      visit '/'

      expect(page).to have_content('Podsmack')
      expect(page).to have_css("img[src*='giphy']")
      expect(page).to have_link("Podsmack")
      expect(page).to_not have_link("Dashboard")
      expect(page).to have_link("Browse")
      expect(page).to have_link("Login")
      expect(page).to have_link("Register")
    end
    it "Shows dashboard link once loged in" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/'
      expect(page).to have_link("Dashboard")
    end

    it "Podsmack button takes you to home page" do
      visit "/"

      click_on('Find your next favorite podcast')
      expect(current_path).to eq('/podcasts')
      click_on('Podsmack')
      expect(current_path).to eq('/')
    end
    it "Dashboard button takes you to your dashboard" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "/"

      click_on('Dashboard')
      expect(current_path).to eq('/dashboard')
    end

    it 'shows 3 random featured podcasts' do 
      user = create(:user)
      podcast1 = create(:podcast, active: true)
      podcast2 = create(:podcast, active: true)
      podcast3 = create(:podcast, active: true)
      podcast4 = create(:podcast)
      podcast5 = create(:podcast)

      visit '/'
      expect(page).to have_css(".featured_3", count: 1)
      expect(page).to have_css("section.grid-item", count: 3)
    end

  end
end
