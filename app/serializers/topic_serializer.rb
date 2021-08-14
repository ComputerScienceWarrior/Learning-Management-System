class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :summary, :slug, :course_id
end
