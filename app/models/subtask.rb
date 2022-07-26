class Subtask < ApplicationRecord
    belongs_to :task
    enum status: { continues: 'continues', finished: 'finished' }
end
