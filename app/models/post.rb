class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  # validates :content, presence: true, length: { maximum: 500 }
  validates :content_english, presence: true, length: { maximum: 500 }
  validates :content_japanese, presence: true, length: { maximum: 500 }
  validates :subject_english, presence: true, length: { maximum: 100 }
  validates :subject_japanese, presence: true, length: { maximum: 100 }

  # 検索機能
  scope :search, ->(keyword, scene = nil) {
    query = where("content_english LIKE ?", "%#{keyword}%")
    query = query.where(scene: scene) if scene.present?
    query
  }
end
