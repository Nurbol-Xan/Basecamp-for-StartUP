class Task < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :subtasks, dependent: :destroy


    enum status: { continues: 'continues', finished: 'finished' }
end
