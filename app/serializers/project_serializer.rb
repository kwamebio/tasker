class ProjectSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :id
end
