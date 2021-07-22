class Public::HomesController < ApplicationController
  def top
    @genre = Genre.all
    @item = Item.order(updated_at: :DESC).limit(4)
  end

end
