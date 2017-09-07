class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bug

  validates :body, presence: true
end
