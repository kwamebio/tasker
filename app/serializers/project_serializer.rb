class ProjectSerializer
  include JSONAPI::Serializer
  attributes :title, :description
end
