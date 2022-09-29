class Admin::HomesController < ApplicationController
  def top
    @order_detail = OrderDetail.all
  end
end
