class PostItem < ApplicationRecord
  
  validates :item_name, presence: true
  
  # 同一商品の二重登録を防ぐ
  validates :item_name, uniqueness: { scope: :shop_id }
  
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :shop
  belongs_to :genre
  has_one_attached :item_image
  
  
  
  def get_image(width, height)
    item_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def bookmark_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  PREFECTURES = %w(
    北海道
    青森県 岩手県 宮城県 秋田県 山形県 福島県
    茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県
    新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県
    三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県
    鳥取県 島根県 岡山県 広島県 山口県
    徳島県 香川県 愛媛県 高知県
    福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県
    沖縄県
  )
end
