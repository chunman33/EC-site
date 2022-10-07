class Item < ApplicationRecord
  
  has_one_attached :image #itemモデルにimageカラムを追加したかのように扱ってくれる
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  
  def add_tax_price
    (self.excluding_tax_price * 1.10).round # .roundで消費税計算時に表示される小数点以下を切り上げる
  end
  
  
  
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('./app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename:'default-image.jpg', content_type:'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
