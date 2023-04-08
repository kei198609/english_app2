require 'rails_helper'

RSpec.describe Post, type: :model do
  # ビジネスシーンがなければ無効な状態であること
  it "is invalid without scene" do
    post = FactoryBot.build(:post, scene: nil)
    post.valid?
    expect(post.errors[:scene]).to include("が入力されていません。")
  end
  # 件名がなければ無効な状態であること
  it "is invalid without subject" do
    post = FactoryBot.build(:post, subject_english: nil)
    post.valid?
    expect(post.errors[:subject_english]).to include("が入力されていません。")
  end
  # メール本文がなければ無効な状態であること
  it "is invalid without content" do
    post = FactoryBot.build(:post, content_english: nil)
    post.valid?
    expect(post.errors[:content_english]).to include("が入力されていません。")
  end
  # 件名が100文字以上なら無効な状態であること
  it "is subject should not be too long" do
    post = FactoryBot.build(:post, subject_english: "a" * 101)
    post.valid?
    expect(post.errors[:subject_english]).to include("の入力文字数は100文字以内です。")
  end
  # メール本文が2000文字以上なら無効な状態であること
  it "is content should not be too long" do
    post = FactoryBot.build(:post, content_english: "a" * 2001)
    post.valid?
    expect(post.errors[:content_english]).to include("の入力文字数は2000文字以内です。")
  end
  # 件名が英字でなければ無効な状態であること
  it "is Invalid if subject is not alphabetic" do
    post = FactoryBot.build(:post, subject_english: "あいうえお")
    post.valid?
    expect(post.errors[:subject_english]).to include("は英字のみ入力できます。")
  end
  # メール本文が英字でなければ無効な状態であること
  it "is Invalid if content is not alphabetic" do
    post = FactoryBot.build(:post, content_english: "あいうえお")
    post.valid?
    expect(post.errors[:content_english]).to include("は英字のみ入力できます。")
  end
end