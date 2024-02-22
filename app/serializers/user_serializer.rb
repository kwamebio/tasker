class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone_number, :email, :id



  attribute :images do |user|
    user.images.map do |image|
      rails_blob_path(image, only_path: true)
    end
  end

  # attribute :videos do |user|
  #   user.videos.map do |video|
  #     rails_blob_path(video, only_path: true)
  #   end
  # end
end
