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
