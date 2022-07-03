class Answer < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :discussion
end
