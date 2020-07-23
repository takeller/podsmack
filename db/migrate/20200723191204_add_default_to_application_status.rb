class AddDefaultToApplicationStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:applications, :status, 'unapproved')
  end
end
