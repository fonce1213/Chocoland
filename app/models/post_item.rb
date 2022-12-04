class PostItem < ApplicationRecord
  
  validates :item_name, presence: true
  validates :review, presence: true
  validates :price, presence: true
  validates :evaluation, presence: true
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
  belongs_to :shop
  
  def bookmark_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end
    
    new_tags.each do |new|
      new_post_item_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_item_tag
    end
  end
end
