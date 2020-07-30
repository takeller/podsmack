require 'rails_helper'

describe "When I visit the podcast show page" do
  describe "I see a list of podcast episodes " do

    it "see episodes name" do
      podcast = create(:podcast)
      visit "/podcasts/#{podcast.id}"

      within(first('.card-body')) do
        name = find(".card-title").text
        expect(name).not_to be_empty
      end
    end

    it "see episodes description" do
      podcast = create(:podcast)
      visit "/podcasts/#{podcast.id}"

      within(first('.card-body')) do
        description = all("p")[1].text
        expect(description).not_to be_empty
      end
    end
  end
end
