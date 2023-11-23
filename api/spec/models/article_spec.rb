require 'rails_helper'

RSpec.describe Article, type: :model do

  it "titleが存在する場合、記事が有効であること" do
    article = FactoryBot.build(:article, title: "Test Title")
    expect(article).to be_valid
  end

  it "contentが存在する場合、記事が有効であること" do
    article = FactoryBot.build(:article, content: "Test Content")
    expect(article).to be_valid
  end

  it "categoryが存在しない場合、記事が無効であること" do
    article = FactoryBot.build(:article, category: nil)
    article.valid?
    expect(article.errors[:category]).to include("を入力してください")
  end

  it "categoryとの関連を持つこと" do
    relation = described_class.reflect_on_association(:category)
    expect(relation.macro).to eq :belongs_to
  end

  it "article_readingsとの関連を持つこと" do
    relation = described_class.reflect_on_association(:article_readings)
    expect(relation.macro).to eq :has_many
  end

  it "usersとの関連を持つこと" do
    relation = described_class.reflect_on_association(:users)
    expect(relation.macro).to eq :has_many
  end
end
