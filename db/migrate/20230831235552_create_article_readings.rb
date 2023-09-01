class CreateArticleReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :article_readings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
