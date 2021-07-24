class Public::HomesController < ApplicationController
  def top
    @genre = Genre.all
    @item = Item.where(is_active: true).order(updated_at: :DESC).limit(4)
  end

end
