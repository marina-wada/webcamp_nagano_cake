class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    if @order_detail.making_status == "製作中"
      @order.update(status: "製作中")
      redirect_to admin_path(@order_detail.order.id)
    elsif @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "製作完了").count
      @order.update(status: "発送準備中")
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
