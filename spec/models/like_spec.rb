require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:like) { Like.new(user: user, post: post) }

  describe "validations" do
    # Likeモデルのインスタンスが有効であること
    it "is valid with valid attributes" do
      expect(like).to be_valid
    end
    # Likeモデルのインスタンスがuserがnilの場合に無効であること
    it "is not valid without a user" do
      like.user = nil
      expect(like).to_not be_valid
    end
    # Likeモデルのインスタンスがpostがnilの場合に無効であること
    it "is not valid without a post" do
      like.post = nil
      expect(like).to_not be_valid
    end
  end
end
