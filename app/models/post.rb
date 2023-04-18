class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :scene, presence: true
  validates :subject_english, presence: true, length: { maximum: 100 }, format: { with: /\A[a-zA-Z!'’@#?\$%^&*()\d\s.,-]+\z/, allow_blank: true }
  validates :content_english, presence: true, length: { maximum: 2000 }, format: { with: /\A[a-zA-Z!'’@#?\$%^&*()\d\s.,-]+\z/, allow_blank: true }

  # 検索機能
  def self.ransackable_associations(auth_object = nil)
    ["bookmarks", "posts", "users"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["content_english", "scene"]
  end


  # Action Textを使用するため、has_rich_textメソッドを使用して、リレーションシップを設定
  # has_rich_text :content_english
  # has_one       :content_english, class_name: 'ActionText::RichText', as: :record

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy


  # 指定されたユーザーが特定の投稿をブックマークしているかどうかを判定するメソッド
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  # 引数で渡されたユーザidがLikesテーブル内に存在（exists?）するかどうかを調べるメソッド
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
