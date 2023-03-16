class AddTitleToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :type, :string
    add_column :articles, :body, :string
    add_column :articles, :created_by, :string
  end
end
