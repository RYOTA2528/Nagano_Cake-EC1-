class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :price, null: false
      # 購入時価格
      t.integer :amount, null: false
      # 数量
      t.integer :making_status, null: false, default:0
      # 製作ステータス
      t.timestamps null: false
    end
      add_foreign_key :order_details, :orders, column: :order_id
      add_foreign_key :order_details, :items, column: :item_id
  end
end
