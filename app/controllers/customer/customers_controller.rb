class Customer::CustomersController < ApplicationController
  
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to my_page_customers_path
    else
    end
  end
  
  def unsubscribe
    @customer = Customer.find(params[:id])
  end
  
  def withdraw
   @customer = Customer.find(params[:id])
   @customer.update(is_unsubscribed: false)
   reset_session #ログアウトさせる
   redirect_to root_path
  end
  
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
  end
end
