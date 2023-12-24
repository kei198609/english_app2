require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "コメントがない場合は無効である" do
    comment = FactoryBot.build(:comment, comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include("が入力されていません。")
  end
  it "コメントが100文字を超える場合は無効である" do
    comment = FactoryBot.build(:comment, comment: "a" * 101)
    comment.valid?
    expect(comment.errors[:comment]).to include("の入力文字数は100文字以内です。")
  end
end