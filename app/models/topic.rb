class Topic < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged
    belongs_to :course
    has_many :videos
end
