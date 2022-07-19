class AddRoleToPostUser < ActiveRecord::Migration[7.0]
  def change
    add_column :post_users, :role, :string, array: true, default: ["user"]
  end
end
