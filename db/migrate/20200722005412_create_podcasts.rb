class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :location
      t.string :twitter
      t.string :patreon
      t.string :instagram
      t.string :facebook
      t.string :description
      t.boolean :adult_content
      t.string :spotify_uri
      t.string :photo
      t.references :user, foreign_key: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
