class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:customer_id] != nil
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page]).per(10) #@customer.ordersのordersはアソシエーションに記載したもの
    else
      @orders = Order.all.page(params[:page]).per(10)
    end

  end

end
