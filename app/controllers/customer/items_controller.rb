class Customer::ItemsController < ApplicationController
  skip_before_action :authenticate_various_user, only: [:index] #顧客側の商品一覧に対してアクセス制限を解除
  
  def index
    @items = Item.all
     @genres = Genre.all
    if params[:genre_id] # items.index.erbのlink_toから渡ってきたgenre_idパラメータを取得した場合の処理
      @genre = Genre.find(params[:genre_id])# @genreにgenreモデルからgenreのidカラムをパラメータで取得して代入
      @items = @genre.items # @genreモデルitemsメソッドを呼び出してitemの商品全部を@itemsに代入(allメソッドはあってもなくても同じ)
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres =Genre.all
  end

end
