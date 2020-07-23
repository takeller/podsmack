require 'rails_helper'

describe 'As Producer user' do
  it 'can see dashboard' do
    producer = create(:producer)

    visit producer_path(producer)
    expect(page).to have_content(producer.name)
    expect(page).to have_button("Edit Profile")
    expect(page).to have_button("Upload new Podcast")

    # need to test for podcast content when it arrives
  end
end
