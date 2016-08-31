# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  file_name    :string           not null
#  content_type :string           not null
#  data         :binary           not null
#  job_key      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
