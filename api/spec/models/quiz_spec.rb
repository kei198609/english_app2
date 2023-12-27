require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe "associations" do
    it "has many quiz_attempts" do
      category = FactoryBot.create(:category)
      quiz = FactoryBot.create(:quiz, category: category)
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)

      quiz_attempt1 = FactoryBot.create(:quiz_attempt, user: user1, quiz: quiz)
      quiz_attempt2 = FactoryBot.create(:quiz_attempt, user: user2, quiz: quiz)

      expect(quiz.quiz_attempts).to include(quiz_attempt1, quiz_attempt2)
    end

    it "belongs to category" do
      category = FactoryBot.create(:category)
      quiz = FactoryBot.build(:quiz, category: category)
      expect(quiz.category).to eq(category)
    end
  end

  describe "validations" do
    it "日本語の文章がない場合は無効である" do
      quiz = FactoryBot.build(:quiz, sentence_japanese: nil)
      quiz.valid?
      expect(quiz.errors[:sentence_japanese]).not_to be_empty
    end

    it "英語の文章がない場合は無効である" do
      quiz = FactoryBot.build(:quiz, sentence_english: nil)
      quiz.valid?
      expect(quiz.errors[:sentence_english]).not_to be_empty
    end
  end
end
