class CourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :summary, :category, :slug
end
