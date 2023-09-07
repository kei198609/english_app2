class AddIconNameToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :icon_name, :string
  end
end
