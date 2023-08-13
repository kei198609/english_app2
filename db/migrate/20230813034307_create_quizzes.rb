class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :sentence_japanese
      t.string :sentence_english

      t.timestamps
    end
  end
end
