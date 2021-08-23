class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.timestamps null: false

      t.timestamps null: false
    end
    add_foreign_key :addresses, :customers, column: :customer_id
  end
end
