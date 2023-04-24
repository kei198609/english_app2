require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:follower) { create(:user) }
  let(:followed) { create(:user) }
  let(:relationship) { Relationship.new(follower: follower, followed: followed) }

  describe "validations" do
    # Relationshipモデルのインスタンスが有効であること
    it "is valid with valid attributes" do
      expect(relationship).to be_valid
    end
    # follower_idがnilである場合、Relationshipモデルのインスタンスが無効であること
    it "is not valid without a follower_id" do
      relationship.follower_id = nil
      expect(relationship).to_not be_valid
    end
    # followed_idがnilである場合、Relationshipモデルのインスタンスが無効であること
    it "is not valid without a followed_id" do
      relationship.followed_id = nil
      expect(relationship).to_not be_valid
    end
  end

  # Relationshipモデルがfollowerとfollowedという2つの関連付けを持っていることを確認
  describe "associations" do
    # Relationshipモデルのfollowerが正しく関連付けられていること
    it "belongs to a follower" do
      expect(relationship.follower).to eq(follower)
    end
    # Relationshipモデルのfollowedが正しく関連付けられていること
    it "belongs to a followed user" do
      expect(relationship.followed).to eq(followed)
    end
  end
end
