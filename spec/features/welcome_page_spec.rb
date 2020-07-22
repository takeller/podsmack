require 'rails_helper'

RSpec.describe "Podsmack Home Page" do
  describe "General introduction" do
    it "Shows homepage " do

      visit '/'

      expect(page).to have_content('Welcome to Podsmack')
      expect(page).to have_css("img[src*='giphy']")
    end

  end
end