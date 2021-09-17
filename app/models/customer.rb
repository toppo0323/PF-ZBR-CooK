class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 has_many :recipes,dependent: :destroy
 has_many :comments,dependent: :destroy
 has_many :likes,dependent: :destroy
 has_many :reverse_of_follow_relationships, class_name: "FollowRelationship", foreign_key: "followed_id", dependent: :destroy
 has_many :followers, through: :reverse_of_follow_relationships, source: :follower
 has_many :follow_relationships, class_name: "FollowRelationship", foreign_key: "follower_id", dependent: :destroy
 has_many :followings, through: :follow_relationships, source: :followed
 attachment :image
 
 def recipes
   return Recipe.where(customer_id: self.id)
 end
 
 def follow(customer_id)
   follow_relationships.create(followed_id: customer_id)
 end
 def unfollow(customer_id)
   follow_relationships.find_by(followed_id: customer_id).destroy
 end
 def following?(customer)
   followings.include?(customer)
 end
 
 
end
