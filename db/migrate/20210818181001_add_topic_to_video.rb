class AddTopicToVideo < ActiveRecord::Migration[6.0]
  def change
    add_reference :videos, :topic, null: false, foreign_key: true
  end
end
