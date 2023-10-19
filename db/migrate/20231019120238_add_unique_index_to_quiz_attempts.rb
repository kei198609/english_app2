class AddUniqueIndexToQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    add_index :quiz_attempts, [:user_id, :quiz_id], unique: true
  end
end
