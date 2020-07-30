class AddPodcastUriToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :podcast_uri, :string
  end
end
