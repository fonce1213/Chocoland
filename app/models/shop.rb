class Shop < ApplicationRecord
  validates :shop_name, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :shop_URL, presence: true
  
  has_many :post_items, dependent: :destroy
end
