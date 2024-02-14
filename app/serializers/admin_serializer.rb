class AdminSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone_number, :email
end
