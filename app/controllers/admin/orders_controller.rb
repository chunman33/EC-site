class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total = 0
    
  end
  
  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @order.update(order_params)
    # 注文ステータスと製作ステータスを連動させる処理
    if @order.payment_status == "confirm_payment" #注文ステータスの更新ボタン押した時、その値が1(入金確認)で更新されたら、
    # 下の処理でproduction_statusを全て1に更新する。
      @order_detail.update_all(production_status: 1) # (production_status: 1)はハッシュとなっている。
    end
    redirect_to request.referer
  end
  
  
  
  def order_params
    params.require(:order).permit(:payment_status)
  end

 
  
  
end
