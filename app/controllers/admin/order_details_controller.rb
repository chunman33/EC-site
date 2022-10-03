class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order # 4行目で持ってきたorder_detailのid(子要素)からその親要素を特定
    @order_detail.update(order_detail_params)
    if @order_detail.production_status == "manufacturing"
      @order.update(payment_status: 2)
    end
    if @order.production_status_count == @order.order_details.count#@order.order_detailsは5行目の@order(親要素)から子要素を全て持ってくる。
     @order.update(payment_status: 3)
    end
    
    redirect_to request.referer
    
  end
  
  
 private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
  
  
  
end
