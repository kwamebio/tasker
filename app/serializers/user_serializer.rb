class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone_number, :email, :id, :image_url, :video_url

  has_many :tasks
end
