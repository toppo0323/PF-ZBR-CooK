class Recipe < ApplicationRecord
  
  belongs_to :customer
  attachment :image 
end
