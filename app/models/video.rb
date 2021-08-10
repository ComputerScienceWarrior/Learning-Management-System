class Video < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :topics
end
