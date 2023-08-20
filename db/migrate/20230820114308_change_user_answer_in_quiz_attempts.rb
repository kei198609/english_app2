class ChangeUserAnswerInQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    change_column :quiz_attempts, :user_answer, :text
  end
end
