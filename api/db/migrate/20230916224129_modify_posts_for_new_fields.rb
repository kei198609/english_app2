class ModifyPostsForNewFields < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :scene, :string
    remove_column :posts, :content_english, :text
    remove_column :posts, :subject_english, :text

    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_column :posts, :genre, :string
  end
end
