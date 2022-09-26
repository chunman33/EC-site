class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details
  enum payment_method: { credit_card: 0, transfer: 1}  #0(値)が入っている場合はcredit_card(キー)を返すハッシュ、1が入ってる場合はtransfer(銀行振込)
  enum payment_status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish: 4} #{0:入金待ち 1:入金確認 2:製作中 3:発送準備中 4:発送済み}

end
