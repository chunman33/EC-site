class Admin::OrdersController < ApplicationController
  
  def show
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
  end
  
  def update
  end
end
