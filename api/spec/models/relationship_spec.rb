require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:follower) { create(:user) }
  let(:followed) { create(:user) }
  let(:relationship) { Relationship.new(follower: follower, followed: followed) }

  describe "validations" do
    it "正しい属性を持っている場合、有効である" do
      expect(relationship).to be_valid
    end
    it "フォロワーIDが存在しない場合、無効である" do
      relationship.follower_id = nil
      expect(relationship).to_not be_valid
    end
    it "フォローされるユーザーIDが存在しない場合、無効である" do
      relationship.followed_id = nil
      expect(relationship).to_not be_valid
    end
  end

  # Relationshipモデルがfollowerとfollowedという2つの関連付けを持っていることを確認
  describe "associations" do
    it "フォロワーに正しく関連付けられている" do
      expect(relationship.follower).to eq(follower)
    end
    it "フォローされるユーザーに正しく関連付けられている" do
      expect(relationship.followed).to eq(followed)
    end
  end
end
