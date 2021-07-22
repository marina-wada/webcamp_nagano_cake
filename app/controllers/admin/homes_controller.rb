class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.all.page(params[:page]).per(10)
    @order_derail = OrderDetail.all
  end

  def full_name
    self.last_name + " " + self.first_name
  end

end
