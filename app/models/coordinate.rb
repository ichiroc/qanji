class Coordinate < ApplicationRecord
  validates :x, presence: true, numericality: true
  validates :y, presence: true, numericality: true
  belongs_to :word
end
