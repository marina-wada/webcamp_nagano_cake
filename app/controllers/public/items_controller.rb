class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.where(is_active: true).page(params[:page]).per(8)
    @item = Item.where(is_active: true)
    @genre = Genre.all
  end
end
