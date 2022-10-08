class Customer::ItemsController < ApplicationController
  def index
    @items = Item.all
     @genres = Genre.all
    if params[:genre_id] # items.index.erbのlink_toから渡ってきたgenre_idパラメータを取得した場合の処理
      @genre = Genre.find(params[:genre_id])# @genreにgenreモデルからgenreのidカラムをパラメータで取得して代入
      @items = @genre.Item.all # @genreに紐づくitemモデルの商品全部を@itemsに代入
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres =Genre.all
  end

end
