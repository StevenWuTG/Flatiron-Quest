class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_password
      t.integer :user_health, default:10
      t.integer :user_attack, default: 5
      t.integer :user_level, default:1
      t.string :current_quest
    end
  end
end
