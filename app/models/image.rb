class Image < ApplicationRecord
  validates :content_type, presence: true
  validates :data, presence: true
  validates :file_name, presence: true
  has_many :words
  has_many :job_logs

  private

  def latest_job_log
    job_logs.order(updated_at: :desc).limit(1)
  end

end
