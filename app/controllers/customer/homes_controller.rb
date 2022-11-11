class Customer::HomesController < ApplicationController
 skip_before_action :authenticate_various_user
  def top
    @genres = Genre.all 
    @items = Item.all
  end
  
  def about
  end
  

end
