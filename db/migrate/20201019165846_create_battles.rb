class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      # attributes
      
      t.integer :user_id
      t.integer :quest_id
      # t.string :battle_name
      # t.integer :monster_id
      # t.integer :support_id
    end
  end
end
