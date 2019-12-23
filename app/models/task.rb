class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy

  enum status: { pending: 0, done: 1 }
end
