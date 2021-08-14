class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_many :order_details
  attachment :image

  def add_tax_price
    (self.price * 1.10).round
  end

  # scope :search, -> (search_params) do
  #   return if serch_params.blank?

  #   item_like(search_params[:item])
  # end
  # scope :item_like, -> (item) { where('item LIKE ?', "%#{item}%") if item.present? }
end
