class Word < ApplicationRecord
  validates :image, presence: true
  validates :text, presence: true
  validates :score, presence: true, numericality: true
  validates :category, presence: true
  belongs_to :image
end
