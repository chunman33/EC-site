class Customer::OrdersController < ApplicationController
  
  before_action :cart_item_check, {only: [:new]}
  
  def new
    @order = Order.new
    @postage = 800
  end

  def confirm
    @order = Order.new(order_params)
    @total = 0
    @order.postage = 800
    # １つ目の処理
    if params[:order][:select_address] == "0" 
      #orderが渡るとaddressが返ってくる。次にview(form_withのradio_buttonでaddress)が渡って1,2.3のどれかが返ってくる。
      @order.name = current_customer.last_name + current_customer.first_name
      @order.post_code = current_customer.postcode
      @order.address = current_customer.address
      @order.payment_status = 0
    # ２つ目の処理
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
     @order.payment_status = 0
      
    # ３つ目の処理
    elsif params[:order][:select_address] == "2"
      @order.post_code = @order.post_code # ココ以下は書かなくても良い
      @order.address = @order.address
      @order.name = @order.name
     @order.payment_status = 0
    #万が一失敗した場合の処理
    else
      redirect_to cart_items_path
    end   
    # confirm.htmlに渡す変数
    @cart_items = current_customer.cart_items.all
    
  end


  def complete
  end

  def create
    @order = current_customer.orders.new(order_params) #order_paramsからorderの情報を取得し、saveで保存
    if @order.save
    # 注文詳細モデルにカート内情報を取得して保存していく。
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = @order.order_details.new
      @order_details.item_id = cart_item.item.id
      @order_details.purchase_price = cart_item.item.excluding_tax_price
      @order_details.quantity = cart_item.amount
      @order_details.production_status = 0
     @order_details.save
    end
    redirect_to complete_orders_path
    @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
  end

  def show
  end
  
  private
  
  
  def order_params
    params.require(:order).permit(:address,:name, :payment_method, :post_code, :payment_status, :payment_price, :postage, :customer_id)
  end
  
  
  def cart_item_check
    @cart_items = current_customer.cart_items.all
    if @cart_items == []
     redirect_to cart_items_path, flash: {alert:  "カートに商品がありません。"}
    end
  end
  
 
  
end
