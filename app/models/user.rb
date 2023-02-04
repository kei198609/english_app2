class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 10 }
  validates :occupation, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


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
