class AddTagsToApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :tags, :string
  end
end
