class PostItem < ApplicationRecord
  
  validates :item_name, presence: true
  validates :price, presence: true
  
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :shop
  
  def bookmark_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
end
