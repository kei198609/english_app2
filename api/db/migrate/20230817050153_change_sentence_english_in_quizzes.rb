class ChangeSentenceEnglishInQuizzes < ActiveRecord::Migration[7.0]
  def change
    change_column :quizzes, :sentence_japanese, :text
    change_column :quizzes, :sentence_english, :text
  end
end