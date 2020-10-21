class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.integer :user_id
      t.integer :quest_id
      t.integer :monster_id
    end
  end
end
