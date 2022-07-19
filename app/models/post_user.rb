class PostUser < ApplicationRecord
    belongs_to :post

    ROLE = %i[user admin]

    CATEGORY = %i[task_read task_write task_update task_delete]
end
