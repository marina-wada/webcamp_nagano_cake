class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @order.update(order_params)
    if  @order.status == "入金確認"
      @order_detail.update_all(making_status: "製作待ち")
      redirect_to admin_order_path(@order)
    else
      redirect_to admin_order_path(@order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end


end
