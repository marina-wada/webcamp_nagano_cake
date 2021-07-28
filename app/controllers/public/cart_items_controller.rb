class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @order = Order.all
    @sum = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
