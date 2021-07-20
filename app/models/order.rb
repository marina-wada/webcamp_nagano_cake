class Order < ApplicationRecord
  belongs_to :item

  def add_tax_price
    (self.price * 1.10).round
  end

  enum status: { 入金待ち: 0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4 }

  def total_price
    order_derail.to_a.sum { |order| order.total_price }
  end

  def current_shipping_cost
    current_shipping_cost = 800
  end

  def self.current_shipping_cost
    current_shipping_cost = 800
  end
end
