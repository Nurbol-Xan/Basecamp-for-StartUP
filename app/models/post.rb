class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :tasks, dependent: :destroy
    accepts_nested_attributes_for :tasks
end
