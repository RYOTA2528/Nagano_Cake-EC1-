class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
     t.string :last_name, null: false
     t.integer  :customer_id
     t.string :postal_code, null: false
     t.string :address, null: false 
    # 配送先住所
     t.string :name, null: false
    # 配送先宛名
     t.string :name, null: false
     t.integer :name, null: false
    
     t.timestamps null: false
    end
  　add_foreign_key :orders, :customers
  end
end
