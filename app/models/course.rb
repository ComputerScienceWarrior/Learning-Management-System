class Course < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_many :topics
end
