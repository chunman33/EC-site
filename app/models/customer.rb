class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # is_unsubscribedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_unsubscribed == false)
  end
  
end
