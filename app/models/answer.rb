class Answer < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :discussion
  has_rich_text :body
end
