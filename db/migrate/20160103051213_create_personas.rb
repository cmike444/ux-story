class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :persona_name
      t.string :avatar
      t.string :fictional_name
      t.string :role_title
      t.string :quote
      t.string :uuid
      t.text :role_description
      t.text :demographics
      t.text :payload
      t.timestamps
    end
  end
end
