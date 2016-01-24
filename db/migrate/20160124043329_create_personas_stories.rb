class CreatePersonasStories < ActiveRecord::Migration
  def change
    create_table :personas_stories, id: false do |t|
      t.belongs_to :persona, index: true
      t.belongs_to :story, index: true
    end
  end
end
