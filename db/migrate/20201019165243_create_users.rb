class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      # attributes?
      
      t.string :user_name
      t.string :user_password
      t.integer :user_health
      t.integer :user_attack 
      t.integer :user_level
    end
  end
end
