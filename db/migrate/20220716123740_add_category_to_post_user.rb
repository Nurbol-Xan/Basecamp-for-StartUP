class AddCategoryToPostUser < ActiveRecord::Migration[7.0]
  def change
    add_column :post_users, :category, :text, array: true, default: []
  end
end
