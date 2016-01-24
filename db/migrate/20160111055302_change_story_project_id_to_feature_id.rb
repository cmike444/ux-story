class ChangeStoryProjectIdToFeatureId < ActiveRecord::Migration
  def change
    rename_column :stories, :project_id, :feature_id
  end
end
