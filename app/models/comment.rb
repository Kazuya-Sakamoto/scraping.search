class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user  

  validates :comment, length: { in: 1..1000 }, presence: true
end
