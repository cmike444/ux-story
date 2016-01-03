class AddProjectIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :project_id, :integer
    add_index :stories, :project_id
  end
end
