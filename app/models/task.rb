class Task < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :subtasks, dependent: :destroy


    enum status: { active: 'active', disabled: 'disabled' }
end
