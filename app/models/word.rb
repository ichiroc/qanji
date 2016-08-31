# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  english    :string
#  score      :float
#  category   :string
#  image_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_words_on_image_id  (image_id)
#

class Word < ApplicationRecord
  validates :image, presence: true
  validates :text, presence: true
  validates :score, presence: true, numericality: true
  belongs_to :image
  has_many :coordinates
  after_save :fetch_english

  private

  def fetch_english
    wt = WordService::Translator.new(id)
    wt.execute
  end
end
