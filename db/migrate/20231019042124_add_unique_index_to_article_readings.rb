class AddUniqueIndexToArticleReadings < ActiveRecord::Migration[7.0]
  def change
    add_index :article_readings, [:user_id, :article_id], unique: true
  end
end
