class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.where(is_active: true).page(params[:page]).per(8)
    @item = Item.where(is_active: true)
    @genre = Genre.all
  end

  def show
    @genre =Genre.all
    @item = Item.find(params[:id])
    # if @cart_item.blank?
    #   @cart_item = current_customer.cart_item.build(item_id: params[:item_id])
    # end

    # @cart_item.quantity += params[:quantity].to_i
    # @cart_item.save
    # redirect_to current_cart_item
  end



end
