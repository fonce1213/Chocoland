class Tag < ApplicationRecord
  validates :tag_name, presence: true, uniqueness: true
  
  has_many :item_tags, dependent: :destroy
  has_many :post_items, through: :item_tags, dependent: :destroy
end
