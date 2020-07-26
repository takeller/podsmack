require 'rails_helper'

describe "When I visit the podcast show page" do
  describe "I see a list of podcast episodes " do

    it "see episodes name" do
      podcast = create(:podcast)
      visit "/podcasts/#{podcast.id}"

      within(first('.episodes')) do
        name = find(".name").text
        expect(name).not_to be_empty
      end
    end
    it "see episodes description" do

    end
    it "I can play a full episode" do

    end
  end

end
