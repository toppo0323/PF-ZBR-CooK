class Recipe < ApplicationRecord
  
  belongs_to :customer
  attachment :image 
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end
  
end
