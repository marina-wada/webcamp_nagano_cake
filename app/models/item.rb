class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_many :order_details
  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def add_tax_price
    (self.price * 1.10).round
  end

end
