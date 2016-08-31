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

require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
