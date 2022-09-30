class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @postage = 800
  end

  def confirm
    @order = Order.new(order_params)
    # １つ目の処理
    if params[:order][:select_address] == "0" 
      #orderが渡るとaddressが返ってくる。次にview(form_withのradio_buttonでaddress)が渡って1,2.3のどれかが返ってくる。
      @order.name = current_customer.last_name + current_customer.first_name
      @order.post_code = current_customer.postcode
      @order.address = current_customer.address
      @order.postage = 800
    @order.payment_status = 0
    @order.payment_price = @order.postage + @total.to_i
    # ２つ目の処理
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
      @order.postage = 800
    @order.payment_status = 0
    @order.payment_price = @order.postage + @total.to_i
      
    # ３つ目の処理
    elsif params[:order][:select_address] == "2"
      @order.post_code = @order.post_code # ココ以下は書かなくても良い
      @order.address = @order.address
      @order.name = @order.name
      @order.postage = 800
    @order.payment_status = 0
    @order.payment_price = @order.postage + @total.to_i
    #万が一失敗した場合の処理
    else
      redirect_to cart_items_path
    end   
    # confirm.htmlに渡す変数
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params) #order_paramsからorderの情報を取得し、saveで保存
    if @order.save
    # 注文詳細モデルにカート内情報を取得して保存していく。
    @order_details = OrderDetail.new
    @order_details.order_id = @order.id
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details.item_id = cart_item.item.id
      @order_details.purchase_price = cart_item.item.excluding_tax_price
      @order_details.quantity = cart_item.amount
      @order_details.save
      @order_details.production_status = 0
    binding.pry
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
    params.require(:order).permit(:address,:name, :payment_method, :post_code)
  end
  
  
end
