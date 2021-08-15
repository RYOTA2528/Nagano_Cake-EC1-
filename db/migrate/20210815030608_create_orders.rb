class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
     t.integer :customer_id, null: false
     t.string :postal_code, null: false
     t.string :address, null: false
    # 配送先住所
     t.string :name, null: false
    # 配送先宛名
     t.integer :shipping_cost, null: false
    # 送料
     t.integer :total_payment, null: false
    # 請求額
     t.integer :payment_method, null: false, default:0
    # 支払方法
     t.integer :status, null: false, default:0
    #注文ステータス
     t.timestamps null: false
    end
     add_foreign_key :orders, :customers, column: :customer_id
  end
end
