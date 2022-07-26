class AddStatusToSubtask < ActiveRecord::Migration[7.0]
  def change
    add_column :subtasks, :status, :string
  end
end
