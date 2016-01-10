class AddUserIdToPersona < ActiveRecord::Migration
  def change
    add_column :personas, :user_id, :integer
    rename_column :personas, :fictional_name, :location
    add_index :personas, :user_id
  end
end
