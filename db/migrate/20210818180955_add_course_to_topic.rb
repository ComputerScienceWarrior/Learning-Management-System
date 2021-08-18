class AddCourseToTopic < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :course, null: false, foreign_key: true
  end
end
