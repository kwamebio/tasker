class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :status, :body

  belongs_to :user
end
