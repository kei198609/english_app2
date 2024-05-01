class User < ApplicationRecord

  # Include default devise modules.
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :posts, dependent: :destroy
  has_many :quiz_attempts
  has_many :article_readings
  has_many :active_relationships,  class_name: "Relationship",
                                  foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                    dependent: :destroy
  #followingメソッド（フォローしているユーザの集合を手にいれる）
  has_many :following,   through: :active_relationships,
                          source: :followed
  #followersメソッド（フォローされているユーザの集合を手にいれる）
  has_many :followers,   through: :passive_relationships,
                          source: :follower

  has_many :bookmarks, dependent: :destroy
  has_many :likes,     dependent: :destroy
  has_many :comments,  dependent: :destroy
  # 通知
  has_many :active_notifications,  class_name: 'Notification',
                                  foreign_key: 'visitor_id',
                                    dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification',
                                  foreign_key: 'visited_id',
                                    dependent: :destroy

  validates :name,       presence: true, length: { maximum: 10 }
  validates :occupation, presence: true

  #ゲストログイン
  def self.create_guest
    email = "guest_#{Time.current.to_i}#{rand(1000)}@example.com"
    create!(email: email, name: 'ゲストユーザ', occupation: '営業') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  #全員の投稿表示
  def feed
    Post.all
  end

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # フォロー通知メソッド
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end