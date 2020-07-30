class RemoveSpotifyUriFromPodcasts < ActiveRecord::Migration[6.0]
  def change
    remove_column :podcasts, :spotify_uri, :string
  end
end
