class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      # attributes
      
      t.string :mon_name
      t.integer :mon_health
      t.integer :mon_attack
      t.integer :battle_id
      # t.integer :mon_level
      # t.integer :battle_id

    end
  end
end
