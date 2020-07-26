require 'rails_helper'

describe 'As a User' do
  before :each do
    @user = create(:user)
    @podcast = create(:podcast, user: @user, location: "Denver", name: 'podcast1', description: 'description1')
    @podcast2 = create(:podcast, user: @user, location: "NYC", name: 'podcast2', description: 'description2')
    @podcast3 = create(:podcast, user: @user, location: "Denver", name: 'podcast3', description: 'description3')
    @podcast4 = create(:podcast, user: @user, location: "Dallas", name: 'podcast11', description: 'description4', adult_content: true)

    @tag1 = create(:tag, name: 'Interviews')
    @tag2 = create(:tag, name: 'Music')
    @tag3 = create(:tag, name: 'Software')
    @tag4 = create(:tag, name: 'Mystery')
    @tag5 = create(:tag, name: 'Sports')

    create(:podcast_tag, podcast_id: @podcast.id, tag_id: @tag1.id)
    create(:podcast_tag, podcast_id: @podcast2.id, tag_id: @tag2.id) 
    create(:podcast_tag, podcast_id: @podcast2.id, tag_id: @tag4.id)
    create(:podcast_tag, podcast_id: @podcast3.id, tag_id: @tag3.id)
    create(:podcast_tag, podcast_id: @podcast3.id, tag_id: @tag4.id)
    create(:podcast_tag, podcast_id: @podcast3.id, tag_id: @tag5.id)
    
    login_user(@user) 

    visit '/'
    click_on 'Find your next favorite podcast'

  end
  it 'I find podcasts by location' do

    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    page.select 'Denver'

    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 2)

    within('.podcast-browse') do
      expect(page).to have_content('2 Results')
      expect(page).to have_content(@podcast.name)
      expect(page).to have_content(@podcast.description)
      expect(page).to have_content(@podcast3.name)
      expect(page).to have_content(@podcast3.description)
      expect(page).to_not have_content(@podcast2.name)
      expect(page).to_not have_content(@podcast2.description)
    end
  end

  it 'I find podcasts by tag' do
    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    check 'Mystery'
    
    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 2)

    within('.podcast-browse') do
      expect(page).to have_content(@podcast2.name)
      expect(page).to have_content(@podcast2.description)
      expect(page).to have_content(@podcast3.name)
      expect(page).to have_content(@podcast3.description)
      expect(page).to_not have_content(@podcast.name)
      expect(page).to_not have_content(@podcast.description)
    end
  end
  it 'I find podcasts by multiple tags' do
    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    check 'Interviews'
    check 'Sports'
    
    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 2)

    within('.podcast-browse') do
      expect(page).to have_content(@podcast.name)
      expect(page).to have_content(@podcast.description)
      expect(page).to have_content(@podcast3.name)
      expect(page).to have_content(@podcast3.description)
      expect(page).to_not have_content(@podcast2.name)
      expect(page).to_not have_content(@podcast2.description)
    end
  end
  it 'I find podcasts by adult_content' do
    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    check 'adult_content'
    
    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 3)

    within('.podcast-browse') do
      expect(page).to have_content(@podcast.name)
      expect(page).to have_content(@podcast.description)
      expect(page).to have_content(@podcast3.name)
      expect(page).to have_content(@podcast3.description)
      expect(page).to have_content(@podcast2.name)
      expect(page).to have_content(@podcast2.description)
      expect(page).to_not have_content(@podcast4.name)
      expect(page).to_not have_content(@podcast4.description)
    end
  end

  it 'I find podcasts by name' do
    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    fill_in "Name", with: 'Podcast1'
    
    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 2)

    within('.podcast-browse') do
      expect(page).to have_content(@podcast.name)
      expect(page).to have_content(@podcast.description)
      expect(page).to have_content(@podcast4.name)
      expect(page).to have_content(@podcast4.description)
      expect(page).to_not have_content(@podcast2.name)
      expect(page).to_not have_content(@podcast2.description)
      expect(page).to_not have_content(@podcast3.name)
      expect(page).to_not have_content(@podcast3.description)
    end
  end

  it 'I find podcasts by name and location' do
    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    fill_in "Name", with: 'Podcast1'
    page.select 'Denver'
    
    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 1)

    within('.podcast-browse') do
      expect(page).to have_content(@podcast.name)
      expect(page).to have_content(@podcast.description)
      expect(page).to_not have_content(@podcast4.name)
      expect(page).to_not have_content(@podcast4.description)
      expect(page).to_not have_content(@podcast2.name)
      expect(page).to_not have_content(@podcast2.description)
      expect(page).to_not have_content(@podcast3.name)
      expect(page).to_not have_content(@podcast3.description)
    end
  end

  it 'I find podcasts by name and adult_content' do
    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    fill_in "Name", with: 'Podcast1'
    check 'adult_content'
    
    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 1)

    within('.podcast-browse') do
      expect(page).to have_content(@podcast.name)
      expect(page).to have_content(@podcast.description)
      expect(page).to_not have_content(@podcast4.name)
      expect(page).to_not have_content(@podcast4.description)
      expect(page).to_not have_content(@podcast2.name)
      expect(page).to_not have_content(@podcast2.description)
      expect(page).to_not have_content(@podcast3.name)
      expect(page).to_not have_content(@podcast3.description)
    end
  end

  it 'I find podcasts by tag and location' do
    expect(current_path).to eq('/podcasts')
    expect(page).to have_css("#podcast_results", count: 4)

    check 'Mystery'
    page.select 'Denver'

    click_on('Search')

    expect(page).to have_css('.podcast-browse')
    expect(page).to have_css("#podcast_results", count: 1)

    within('.podcast-browse') do
      expect(page).to have_content(@podcast3.name)
      expect(page).to have_content(@podcast3.description)
      expect(page).to_not have_content(@podcast4.name)
      expect(page).to_not have_content(@podcast4.description)
      expect(page).to_not have_content(@podcast2.name)
      expect(page).to_not have_content(@podcast2.description)
      expect(page).to_not have_content(@podcast.name)
      expect(page).to_not have_content(@podcast.description)
    end
  end
end