class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :cart_item, presence: true
  validates :item_id, presence: true
  
 def subtotal
    item.with_tax_price * amount
end
end
