class Task < ApplicationRecord
  belongs_to :admin
  belongs_to :users

  enum status: { pending: 0, completed: 1, canceled: 2}
end
