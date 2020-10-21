class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      # attributes
      
      t.string :support_name
      t.string :support_message
      t.integer :support_health
      t.integer :support_attack
     
    end
  end
end
