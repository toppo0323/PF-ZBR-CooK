class Recipe < ApplicationRecord

  belongs_to :customer
  attachment :image
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :genre_relations
  has_many :genres, through: :genre_relations

  def customer
    return Customer.find_by(id: self.customer_id)
  end

  def self.search(keyword)
    # if keyword.is_a? Integer
    #   where(genre_id: keyword)
    # else
    where(["name like?", "%#{keyword}%"])
#    end
  end

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

  validates :name, presence: true
  validates :ingredient, presence: true
  validates :process, presence: true
  validates :image, presence: true
  
end
