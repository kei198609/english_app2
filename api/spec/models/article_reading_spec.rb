require 'rails_helper'

RSpec.describe ArticleReading, type: :model do
  it "userが存在しない場合は無効であること" do
    article_reading = FactoryBot.build(:article_reading, user: nil)
    article_reading.valid?
    expect(article_reading.errors[:user]).not_to be_empty
  end

  it "articleが存在しない場合は無効であること" do
    article_reading = FactoryBot.build(:article_reading, article: nil)
    article_reading.valid?
    expect(article_reading.errors[:article]).not_to be_empty
  end

  it "readフィールドのデフォルト値がfalseであること" do
    article_reading = FactoryBot.create(:article_reading)
    expect(article_reading.read).to eq(false)
  end
end
