class AddBodyToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :body, :string
    add_column :comments, :post_id, :integer
    add_column :comments, :created_by, :string
  end
end
