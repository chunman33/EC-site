class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end
  
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present? #current_customerのcart_itemと紐づくitem_idがあるかどうかを判別
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]) #current_customerのcart_itemからitem_idを持ってきて変数に格納
    cart_item.amount += params[:cart_item][:item_id].to_i  #cart_itemモデルのitem_idを取得し、そこに紐づくamountカラムに数値を追加
    cart_item.save
    redirect_to cart_items_path
    elsif cart_item.save
     redirect_to cart_items_path
    else
       @cart_items = CartItem.all
       @total = 0
      render :index
    end
  end
  
  def update
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @cart_item.amount += params[:cart_item][:item_id].to_i
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
    elsif @cart_item.update(cart_item_params)
    redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items.all
      @total = 0
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
  end

 private
 def cart_item_params
   params.require(:cart_item).permit(:amount, :item_id)
 end
  
end
