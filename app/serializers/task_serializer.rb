class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :status, :body

  attribute :user do |task|
    UserSerializer.new(task.user).serializable_hash[:data][:attributes]
  end

  belongs_to :user
end
