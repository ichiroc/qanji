class Word < ApplicationRecord
  validates :image, presence: true
  validates :text, presence: true
  validates :score, presence: true, numericality: true
  belongs_to :image
  has_many :coordinates
end
