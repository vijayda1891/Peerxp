class Task < ApplicationRecord
  belongs_to :project

  enum status: { pending: 0, done: 1 }
end
