class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
     @items = @items.where('name LIKE ?',"%#{params[:search]}%") if params[:search].present?
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to 
    else
      render
    end
  end
  
  private 
  
  def item_params
    params.require(:item).permit(:genre_id, :image, :name, :description, :excluding_tax_price, :sale_status)
  end

end
