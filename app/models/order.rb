class Order < ApplicationRecord
  
  enum payment_method: { credit_card: 0, transfer: 1}  #0(値)が入っている場合はcredit_card(キー)を返すハッシュ、1が入ってる場合はtransfer(銀行振込)
end
