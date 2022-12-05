class Shop < ApplicationRecord
  with_options presence: true, on: :publicize do
    validates :shop_name
    validates :address
    validates :telephone_number
    validates :shop_URL
  end
  
  has_many :post_items, dependent: :destroy
end
