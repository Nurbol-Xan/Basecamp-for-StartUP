class PostUser < ActiveRecord::Migration[7.0]
  def change
    add_column :post_users, :role, :integer, default: 0
  end
end
