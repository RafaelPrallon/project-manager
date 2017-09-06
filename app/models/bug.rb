class Bug < ApplicationRecord
  has_many :comments
  belongs_to :project
end