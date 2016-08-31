# == Schema Information
#
# Table name: job_logs
#
#  id         :integer          not null, primary key
#  key        :string           not null
#  status     :string           not null
#  queue_time :datetime         not null
#  message    :string
#  raw_text   :text             not null
#  image_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_job_logs_on_image_id  (image_id)
#

class JobLog < ApplicationRecord
  belongs_to :image
end
