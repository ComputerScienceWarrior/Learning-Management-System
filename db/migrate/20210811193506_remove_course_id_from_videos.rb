class RemoveCourseIdFromVideos < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :course_id, :integer
  end
end
