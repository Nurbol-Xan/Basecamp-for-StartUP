class ChangeViewsForUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :views, :integer, defoult: 0
  end
end
