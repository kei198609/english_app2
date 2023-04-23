require 'rails_helper'

RSpec.describe Comment, type: :model do
  # コメントがなければ無効な状態であること
  it "is invalid without comment" do
    comment = FactoryBot.build(:comment, comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include("が入力されていません。")
  end
  #コメントが100文字以上なら無効な状態であること
  it "is comment should not be too long" do
    comment = FactoryBot.build(:comment, comment: "a" * 101)
    comment.valid?
    expect(comment.errors[:comment]).to include("の入力文字数は100文字以内です。")
  end
end
