require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe "validations" do
    let(:user) { FactoryBot.build(:user) }
    let(:post) { FactoryBot.build(:post) }

    context "when user bookmarks a post" do
      it "正しい属性を持っている場合、有効である" do
        bookmark = FactoryBot.build(:bookmark, user: user, post: post)
        expect(bookmark).to be_valid
      end
    end
  end
end
