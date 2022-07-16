class Post < ApplicationRecord
    belongs_to :user
    has_many :post_users, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_many :discussions, dependent: :destroy
    accepts_nested_attributes_for :tasks
    accepts_nested_attributes_for :discussions
end
