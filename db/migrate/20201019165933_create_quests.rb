class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      # attributes
      
      t.string :quest_name
      t.integer :quest_level
    
    end
  end
end
