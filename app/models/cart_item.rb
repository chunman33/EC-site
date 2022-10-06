class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :amount, presence: true
  validates :item_id, presence: true
  
  
  def total_price
    item.add_tax_price * amount # itemモデルのadd_tax_priceメソッドを呼び出している。
  end
end
