class PostItem < ApplicationRecord
  
  validates :item_name, presence: true
  validates :review, presence: true
  validates :price, presence: true
  validates :evaluation, presence: true
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  belongs_to :shop
  
  def bookmark_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
end
