class Customer::CustomersController < ApplicationController
  
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
    end
  end
  
  def unsubscribe
    @customer = current_customer
  end
  
  def withdraw
   @customer = current_customer
   @customer.update(is_unsubscribed: true)
   reset_session #ログアウトさせる
   redirect_to root_path
  end
  
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
  end
end
