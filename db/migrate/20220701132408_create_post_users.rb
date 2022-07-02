class CreatePostUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :post_users do |t|
      t.string :content
      t.belongs_to :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
