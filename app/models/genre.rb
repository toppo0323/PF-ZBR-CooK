class Genre < ApplicationRecord
  
  has_many :genre_relations
  has_many :recipes, through: :genre_relations
  
end
