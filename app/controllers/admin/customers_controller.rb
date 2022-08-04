class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end
  
  protected
  
  def admin_params
    
  end
  
end
