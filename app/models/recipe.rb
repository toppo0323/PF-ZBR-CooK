class Recipe < ApplicationRecord

  belongs_to :customer
  attachment :image
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :genre_relations
  has_many :genres, through: :genre_relations

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
