class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 10 }
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
    Post.where("user_id = ?", id)
  end

end
