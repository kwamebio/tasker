class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :status, :body, :start_date, :end_date

  attribute :user do |task|
    UserSerializer.new(task.user).serializable_hash[:data][:attributes]
  end

  belongs_to :user
end
