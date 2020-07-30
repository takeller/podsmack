require 'rails_helper'

RSpec.describe SearchResult do
 
  describe 'methods' do
    it 'from_api ', :vcr do 
      results = SearchResult.from_api('conan')
      expect(results.length).to eq(10)
      expect(results.first).to be_an_instance_of(SearchResult)
      expect(results.last).to be_an_instance_of(SearchResult)
      expect(results.first.title).to eq('Conan O’Brien Needs A Friend')
    end

    it 'in_database?' do
      user1 = create(:user)
      podcast = user1.podcasts.create({name: "Armchair Expert with Dax Shepard",
                                      location: "Denver",
                                      description: "Hi, I’m Dax Shepard, and I love talking to people....",
                                      adult_content: true,
                                      photo: "https://cdn-images-1.listennotes.com/podcasts/armc...",
                                      active: false, podcast_uri: "d50f00edeb8c446f955f80716154a3a3"})

      result1 = SearchResult.new({title: 'title',
                                  description: "description",
                                  thumbnail: 'thumbnail',
                                  id: '17'})

      result2 = SearchResult.new({title: 'title',
                                  description: "description",
                                  thumbnail: 'thumbnail',
                                  id: podcast.podcast_uri})

      expect(result1.in_database?).to eq(false)
      expect(result2.in_database?).to eq(true)
    end
  end
end