class AddTopicIdToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :topic_id, :integer
  end
end
