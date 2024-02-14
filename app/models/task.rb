class Task < ApplicationRecord
  belongs_to :admin
  has_many :users, through: :admin

  enum status: { pending: 0, completed: 1, canceled: 2}
end