class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships,  class_name: "Relationship",
                                  foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                    dependent: :destroy
  #followingメソッド（フォローしているユーザの集合を手にいれる）
  has_many :following, through: :active_relationships,
                        source: :followed
  #followersメソッド（フォローされているユーザの集合を手にいれる）
  has_many :followers, through: :passive_relationships,
                        source: :follower


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,       presence: true, length: { maximum: 10 }
  validates :occupation, presence: true

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # AvatarUploaderクラスとavatarカラムを紐づけ
  mount_uploader :avatar, AvatarUploader

  def self.guest #クラスメソッド
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.name = 'ゲスト'
    end
  end

  def feed
    # following_ids = "SELECT followed_id FROM relationships
    #                   WHERE  follower_id = :user_id"
    # Post.where("user_id IN (#{following_ids})
    #                   OR user_id = :user_id", user_id: id)
    Post.all #全員の投稿表示
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

end
