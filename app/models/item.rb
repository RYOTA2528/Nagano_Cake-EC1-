class Item < ApplicationRecord
  belongs_to :admin
  attachment :image


  def add_tax_price
        (self.price * 1.10).round
  validates :name, presence: true
  validates :introduction, presence: true

  end
end
