class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum production_status: {impossible_manufacture: 0, waiting_manufacture: 1, manufacturing: 2, finish: 3 } #0:着手不可 1:製作待ち 2:製作中 3:製作完了
  
  def total_price
    item.add_tax_price * quantity # itemモデルのadd_tax_priceメソッドを呼び出している。
  end

end
