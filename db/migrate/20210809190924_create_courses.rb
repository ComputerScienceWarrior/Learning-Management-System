class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.text :title
      t.text :summary
      t.text :category

      t.timestamps
    end
  end
end
