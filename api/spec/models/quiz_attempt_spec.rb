require 'rails_helper'

RSpec.describe QuizAttempt, type: :model do
  # 必要な関連付けが正しく行われていること
  describe "associations" do
    it "belongs to user" do
      user = FactoryBot.create(:user)
      quiz_attempt = FactoryBot.build(:quiz_attempt, user: user)
      expect(quiz_attempt.user).to eq(user)
    end
    it "belongs to quiz" do
      category = FactoryBot.create(:category)
      quiz = FactoryBot.create(:quiz, category: category)
      quiz_attempt = FactoryBot.build(:quiz_attempt, quiz: quiz)
      expect(quiz_attempt.quiz).to eq(quiz)
    end
  end

  # user_answerの存在性
  describe "validations" do
    it "user_answerが存在していれば有効であること" do
      user = FactoryBot.create(:user)
      category = FactoryBot.create(:category)
      quiz = FactoryBot.create(:quiz, category: category)
      quiz_attempt = FactoryBot.build(:quiz_attempt, user: user, quiz: quiz, user_answer: "テスト回答")
      expect(quiz_attempt).to be_valid
    end

    it "user_answerが存在しなければ無効であること" do
      quiz_attempt = FactoryBot.build(:quiz_attempt, user_answer: nil)
      quiz_attempt.valid?
      expect(quiz_attempt.errors[:user_answer]).not_to be_empty
    end
  end
end
