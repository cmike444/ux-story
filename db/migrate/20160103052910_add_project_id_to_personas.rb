class AddProjectIdToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :project_id, :integer
    add_index :personas, :project_id
  end
end
