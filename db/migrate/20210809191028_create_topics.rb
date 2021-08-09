class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.text :title
      t.text :summary
      t.integer :course_id

      t.timestamps
    end
  end
end
