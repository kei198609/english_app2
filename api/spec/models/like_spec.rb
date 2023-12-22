require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:like) { Like.new(user: user, post: post) }

  describe "validations" do
    it "正しい属性を持っている場合、有効である" do
      expect(like).to be_valid
    end
    it "ユーザーが存在しない場合、無効である" do
      like.user = nil
      expect(like).to_not be_valid
    end
    it "投稿が存在しない場合、無効である" do
      like.post = nil
      expect(like).to_not be_valid
    end
  end
end
