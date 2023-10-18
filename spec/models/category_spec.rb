require 'rails_helper'

RSpec.describe Category, type: :model do
  it "category_nameが存在する場合、カテゴリが有効であること" do
    category = FactoryBot.build(:category, category_name: "Test Category")
    expect(category).to be_valid
  end

  it "quizzesとの関連を持つこと" do
    relation = described_class.reflect_on_association(:quizzes)
    expect(relation.macro).to eq :has_many
  end

  it "articlesとの関連を持つこと" do
    relation = described_class.reflect_on_association(:articles)
    expect(relation.macro).to eq :has_many
  end
end
