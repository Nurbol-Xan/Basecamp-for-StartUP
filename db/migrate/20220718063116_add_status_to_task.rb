class AddStatusToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :status, :string
  end
end
