class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(order).permit(:payment_method, :postal_code, :address, :name)
  end
end
