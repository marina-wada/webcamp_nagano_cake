class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "制作中"
      @order.update(status: "制作中")
      redirect_to admin_path(@order_detail.order.id)
    elsif @order_detail.making_status("制作完了") < @order.order_details
      redirect_to admin_path(@order_detail.order.id)
    elsif @order_detail.making_status("制作完了") == @order.order_details
      @order.update(status: "発送待ち")
      redirect_to admin_path(@order_detail.order.id)
    else
      redirect_to admin_path(@order_detail.order.id)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
