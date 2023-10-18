class QuizAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  validates :user_answer, presence: true
end
