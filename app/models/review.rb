class Review < ApplicationRecord
  with_options presence: true, on: :publicize do
    validates :review
    validates :evaluation
  end
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :review_tags, dependent: :destroy
  has_many :tags, through: :review_tags, dependent: :destroy
  belongs_to :post_item
  
  def favorite_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end
    
    new_tags.each do |new|
      new_review_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_review_tag
    end
  end
end
