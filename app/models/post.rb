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

  has_many :bookmarks,     dependent: :destroy
  has_many :likes,         dependent: :destroy
  has_many :comments,      dependent: :destroy
  has_many :notifications, dependent: :destroy

  # 指定されたユーザーが特定の投稿をブックマークしているかどうかを判定するメソッド
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  # 引数で渡されたユーザidがLikesテーブル内に存在（exists?）するかどうかを調べるメソッド
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end


  # いいね通知メソッド
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end


  # コメント通知メソッド
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end