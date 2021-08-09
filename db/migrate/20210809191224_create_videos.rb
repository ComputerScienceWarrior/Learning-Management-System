class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.text :title
      t.text :caption
      t.text :summary
      t.text :video_url
      t.text :thumbnail_url
      t.integer :course_id

      t.timestamps
    end
  end
end
