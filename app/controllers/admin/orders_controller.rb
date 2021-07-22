class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
  end

  def full_name
    self.last_name + " " + self.first_name
  end

  def update
    @order.update(order.params)
    redirect_to admin_order_path(@order)
  end
end
