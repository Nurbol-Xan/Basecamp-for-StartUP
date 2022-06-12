class Question < ApplicationRecord
    belongs_to :user
    has_many :answers, dependent: :destroy
end
