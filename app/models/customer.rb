class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items
  has_many :orders
  
  # is_unsubscribedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_unsubscribed == false)
  end
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  
end
