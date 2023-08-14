class CreateQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.string :user_answer
      t.boolean :correct

      t.timestamps
    end
  end
end
