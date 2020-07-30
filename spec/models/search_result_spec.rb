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
  end
end