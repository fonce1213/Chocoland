class Tag < ApplicationRecord
  validates :tag_name, presence: true, uniqueness: true
  
  has_many :review_tags, dependent: :destroy
  has_many :reviews, through: :review_tags, dependent: :destroy
end
