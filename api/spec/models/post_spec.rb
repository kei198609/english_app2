require 'rails_helper'

RSpec.describe Post, type: :model do
  # ジャンルがなければ無効な状態であること
  it "is invalid without genre" do
    post = FactoryBot.build(:post, genre: nil)
    post.valid?
    expect(post.errors[:genre]).not_to be_empty
  end
  # タイトルがなければ無効な状態であること
  it "is invalid without title" do
    post = FactoryBot.build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).not_to be_empty
  end
  # 内容がなければ無効な状態であること
  it "is invalid without content" do
    post = FactoryBot.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).not_to be_empty
  end
  # タイトルが100文字以上なら無効な状態であること
  it "is title should not be too long" do
    post = FactoryBot.build(:post, title: "a" * 101)
    post.valid?
    expect(post.errors[:title]).not_to be_empty
  end
  # 内容が2000文字以上なら無効な状態であること
  it "is content should not be too long" do
    post = FactoryBot.build(:post, content: "a" * 2001)
    post.valid?
    expect(post.errors[:content]).not_to be_empty
  end
end