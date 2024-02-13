class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone_number, :email, :id

  has_many :tasks
end
