class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.text :title
      t.text :summary
      t.text :slug
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
