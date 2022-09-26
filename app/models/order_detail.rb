class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  enum production_status: {impossible_manufacture: 0, waiting_manufacture: 1, manufacturing: 2, finish: 3 } #0:着手不可 1:製作待ち 2:製作中 3:製作完了
end
