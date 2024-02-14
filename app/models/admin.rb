class Admin < ApplicationRecord

  has_many :tasks

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
