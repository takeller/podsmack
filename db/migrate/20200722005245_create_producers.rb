class CreateProducers < ActiveRecord::Migration[6.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :access_token
      t.string :refresh_token
      t.integer :role
      t.string :password_digest

      t.timestamps
    end
  end
end
