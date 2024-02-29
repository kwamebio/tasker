class Admin < ApplicationRecord

  has_many :tasks

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  def token
    update(auth_token: JsonWebToken.encode({ user_id: id }))
    auth_token
  end

end
