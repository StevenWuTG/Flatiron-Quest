class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      # attributes
      
      t.string :support_name
      t.integer :support_health
      t.integer :support_attack
     
    end
  end
end
