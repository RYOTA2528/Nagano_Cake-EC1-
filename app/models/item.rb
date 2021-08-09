class Item < ApplicationRecord
  attachment :image
 belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true

  def add_tax_price
        (self.price * 1.10).round

  end
end
