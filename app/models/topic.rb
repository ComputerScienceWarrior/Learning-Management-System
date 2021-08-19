class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :course
  has_many :videos
  accepts_nested_attributes_for :videos
end