require 'rails_helper'

describe "When I visit the podcast show page" do
  describe "I see a list of podcast episodes " do

    it "see episodes name", :vcr do
      podcast = create(:podcast)
      visit "/podcasts/#{podcast.id}"

      within(first('.episodes')) do
        name = find(".title").text
        expect(name).not_to be_empty
      end
    end

    it "see episodes description", :vcr do
      podcast = create(:podcast)
      visit "/podcasts/#{podcast.id}"

      within(first('.episodes')) do
        description = find(".description").text
        expect(description).not_to be_empty
      end
    end
  end
end
