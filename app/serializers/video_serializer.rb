class VideoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :caption, :summary, :video_url, :thumbnail_url, :slug, :topic_id
end
