class Public::OrdersController < ApplicationController
  def new
    if current_customer.cart_items.blank?
      redirect_to cart_items_path
    else
        @order = Order.new
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total_payment = 0
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    @order.shipping_cost = 800
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_option] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.total_payment = params[:total_payment]
    @order.payment_method = params[:order][:payment_method].to_i
    @order.save
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item.id
        @order_detail.order_id = @order.id
        @order_detail.price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.save
    current_customer.cart_items.destroy_all
      end
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
