class AddContentJapaneseToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :content_japanese, :text
    add_column :posts, :content_english, :text
    add_column :posts, :subject_japanese, :text
    add_column :posts, :subject_english, :text
  end
end
