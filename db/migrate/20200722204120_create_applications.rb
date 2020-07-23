class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :podcast_name
      t.string :location
      t.string :twitter
      t.string :patreon
      t.string :instagram
      t.string :facebook
      t.string :description
      t.boolean :adult_content
      t.string :spotify_uri
      t.string :photo 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
