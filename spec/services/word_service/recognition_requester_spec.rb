# coding: utf-8
require 'rails_helper'

describe WordService::RecognitionRequester do
  describe '#execute' do
    before do
      file_path = "#{Rails.root}/db/seed_data/sample.jpg"
      @image_id = Image.create(file_name: File.basename(file_path),
                               data: File.new(file_path, 'rb').read,
                               content_type: 'image/jpeg').id
      @service = WordService::RecognitionRequester.new(@image_id)
    end

    let(:image) { Image.find @image_id }
    example '実行するとJobLogが登録される' do
      initial_log_size = image.job_logs.size
      expect { @service.execute }.to change { image.job_logs.reload.size }
        .from(initial_log_size)
        .to(initial_log_size + 1)
      expect(image.latest_job_log).not_to be_blank
    end
  end
end
