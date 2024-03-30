class User < ApplicationRecord
  self.primary_key = 'id'

  has_secure_password
  has_many :tasks
  belongs_to :project, optional: true
  has_many :notifications
  has_many_attached :images
  # has_many_attached :videos do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [100, 100]
  # end

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :email, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[A-Z])(?=.*[\W_])/, message: "must include at least one capital letter and one symbol" }, on: :create


  enum role: { user: 0, admin: 1 }


  def token
    update(auth_token: JsonWebToken.encode({ user_id: id }))
    auth_token
  end

  def image_url
    images.attached? ? Rails.application.routes.url_helpers.rails_blob_path(images.first, only_path: true) : nil
  end


end
