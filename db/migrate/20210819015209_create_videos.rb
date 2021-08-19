class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.text :title
      t.text :caption
      t.text :summary
      t.text :video_url
      t.text :thumbnail_url
      t.belongs_to :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
