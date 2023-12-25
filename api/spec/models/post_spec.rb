require 'rails_helper'

RSpec.describe Post, type: :model do
  it "genreがない場合は無効である" do
    post = FactoryBot.build(:post, genre: nil)
    post.valid?
    expect(post.errors[:genre]).not_to be_empty
  end
  it "titleがない場合は無効である" do
    post = FactoryBot.build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).not_to be_empty
  end
  it "contentがない場合は無効である" do
    post = FactoryBot.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).not_to be_empty
  end
  it "titleが100文字を超える場合は無効である" do
    post = FactoryBot.build(:post, title: "a" * 101)
    post.valid?
    expect(post.errors[:title]).not_to be_empty
  end
  it "contentが2000文字を超える場合は無効である" do
    post = FactoryBot.build(:post, content: "a" * 2001)
    post.valid?
    expect(post.errors[:content]).not_to be_empty
  end
end