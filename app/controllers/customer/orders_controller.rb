class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    # １つ目の処理
    if params[:order][:address] == "1" 
      #orderが渡るとaddressが返ってくる。次にview(form_withのradio_buttonでaddress)が渡って1,2.3のどれかが返ってくる。
      
      @order.name = current_customer.last_name + current_customer.first_name
      @order.post_code = current_customer.postcode
      @order.address = current_customer.address
      binding.pry
    # ２つ目の処理
    elsif params[:order][:address] = "2"
      if Address.exists?(name: params[:order][:registered])
    
      end
    # ３つ目の処理
    elsif params[:order][:address] == "3"
      address_new = current_customer.addresses.new(order_params)
      if address_new.save
      else
        render :new
      end
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
