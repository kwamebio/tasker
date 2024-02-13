class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :email, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[A-Z])(?=.*[\W_])/, message: "must include at least one capital letter and one symbol" }, on: :create

  def token
    update(auth_token: JsonWebToken.encode({ user_id: id }))
    auth_token
  end

end
