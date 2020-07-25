require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a podcasts show page' do
    it 'I can see details about the podcast' do
      podcast = create(:podcast)
      bad_tags = create_list(:tag, 3)
      tags = create_list(:tag, 5)
      tags.each do |tag|
        create(:podcast_tag, podcast_id: podcast.id, tag_id: tag.id)
      end
      visit "/podcasts/#{podcast.id}"

      expect(podcast.tags.count).to eq(5)
      expect(page).to have_content(podcast.name)
      expect(page).to have_content(podcast.location)
      expect(page).to have_content(podcast.description)
      expect(page).to have_content(podcast.twitter)
      expect(page).to have_content(podcast.patreon)
      expect(page).to have_content(podcast.instagram)
      expect(page).to have_content(podcast.facebook)
      expect(".podcast-photo").to_not be_empty

      # Needs to test podcast episodes here.

      within('.tags') do
        podcast.tags.each do |tag|
          expect(page).to have_content(tag.name)
        end

        bad_tags.each do |bad_tag|
          expect(page).to_not have_content(bad_tag.name)
        end
      end
    end

    it 'I dont see a button to follow the podcast' do
      podcast = create(:podcast)

      visit "/podcasts/#{podcast.id}"

      expect(page).to_not have_button('Follow')
    end
  end
end

describe 'As a user' do
  describe 'When I visit a podcasts show page' do
    it 'I see a button to follow the podcast' do
      podcast = create(:podcast)
      visit "/podcasts/#{podcast.id}"

      expect(page).to have_button('Follow')
    end
  end
end
