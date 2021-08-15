class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "admin/sessions" && path[:action] == "new"
      @orders = Order.all.page(params[:page]).per(10)
    elsif path[:controller] == "application" && path[:action] == "application"
      @orders = Order.all.page(params[:page]).per(10)
    else path[:controller] == "admin/customers" && path[:action] == "show"
      @orders = Order.find(customer)
    end
  end

end
