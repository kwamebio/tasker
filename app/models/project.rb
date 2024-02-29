class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks
  has_many :admins
end
