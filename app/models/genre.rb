class Genre < ApplicationRecord
  has_many :post_items
  
  validates :genre_name, presence: true, uniqueness: true
end
