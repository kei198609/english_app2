class RemoveContentFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :content, :text
    remove_column :posts, :content_japanese, :text
    remove_column :posts, :subject_japanese, :text
  end
end
