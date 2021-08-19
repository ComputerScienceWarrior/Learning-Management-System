class Course < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged
    has_many :topics
    accepts_nested_attributes_for :topics
end
