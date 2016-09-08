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
#  width        :integer
#  height       :integer
#

class Image < ApplicationRecord
  validates :content_type, presence: true
  validates :data, presence: true
  validates :file_name, presence: true
  has_many :words
  has_many :job_logs

  def latest_job_log
    job_logs.last
  end
end
