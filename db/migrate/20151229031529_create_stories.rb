class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :type
      t.string :name
      t.string :description
      t.boolean :draft
      t.string :author
      t.string :uuid
      t.integer :user_id
      t.text :payload      
      t.timestamps
    end
  end
end
