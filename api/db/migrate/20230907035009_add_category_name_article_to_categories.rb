class AddCategoryNameArticleToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :category_name_article, :string
  end
end
