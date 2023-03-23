class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content_english, presence: true, length: { maximum: 2000 }
  validates :subject_english, presence: true, length: { maximum: 100 }
  validates :scene, presence: true

  # 検索機能
  # scope :search, ->(keyword, scene = nil) {
  #   query = where("content_english LIKE ?", "%#{keyword}%")
  #   query = query.where(scene: scene) if scene.present?
  #   query
  # }
  # scope :search, ->(keyword, scene = nil) {
  #   query = all
  #   query = query.where("content_english LIKE ?", "%#{keyword}%") if keyword.present?
  #   query = query.where(scene: scene) if scene.present?
  #   query.order(created_at: :desc)
  # }
  def self.ransackable_associations(auth_object = nil)
    ["bookmarks", "posts", "users"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["action_text_rich_text_body", "created_at", "id", "scene", "subject_english", "updated_at", "user_id"]
  end


  
  # Action Textを使用するため、has_rich_textメソッドを使用して、リレーションシップを設定
  has_rich_text :content_english
  has_one :action_text_rich_text, class_name: 'ActionText::RichText', as: :record

  has_many :bookmarks, dependent: :destroy
    # 指定されたユーザーが特定の投稿をブックマークしているかどうかを判定するメソッド
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
