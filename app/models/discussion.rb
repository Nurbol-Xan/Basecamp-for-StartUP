class Discussion < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :answers, dependent: :destroy
    # accepts_nested_attributes_for :answers
end
