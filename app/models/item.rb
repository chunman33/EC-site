class Item < ApplicationRecord
  
  has_one_attached :image #itemモデルにimageカラムを追加したかのように扱ってくれる
  belongs_to :genre
end
