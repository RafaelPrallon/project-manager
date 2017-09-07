class Bug < ApplicationRecord
  has_many :comments
  belongs_to :project

  validates :title, presence: true
  validates :description, presence: true
  validates :solved, presence: true

  def resolvido
    return "sim" if self.solved == true
    return "não"
  end
end