# == Schema Information
#
# Table name: coordinates
#
#  id         :integer          not null, primary key
#  x          :float            not null
#  y          :float            not null
#  word_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_coordinates_on_word_id  (word_id)
#

class Coordinate < ApplicationRecord
  validates :x, presence: true, numericality: true
  validates :y, presence: true, numericality: true
  belongs_to :word
end
