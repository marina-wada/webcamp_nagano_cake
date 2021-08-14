class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.where(is_active: true).page(params[:page]).per(8)
    @item = Item.where(is_active: true)
    @genre = Genre.all
  end

  def show
    @genre =Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  # def item_search_params
  #   params.fetch(:search, {}).permit(:name)
  # end

end
