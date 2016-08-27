# coding: utf-8
require 'rails_helper'

RSpec.describe WordService::ResultRequester do
  describe '#execute' do
    before do
      @image = Image.create(file_name: File.basename(file_path),
                            data: File.new(file_path, 'rb').read,
                            content_type: 'image/jpeg')
    end
    let(:file_path) { "#{Rails.root}/db/seed_data/sample.jpg" }

    let(:recognition_service) { WordService::RecognitionRequester.new(@image.id) }
    let(:status) { @result['job']['@status'] }
    let(:words) { @image.words.reload }
    let(:coordinates) { words.first.coordinates }

    context 'すぐ結果を取得した場合' do
      before do
        recognition_service.execute
        rsv= WordService::ResultRequester.new(@image.id)
        @result = rsv.execute
      end

      example '"process"のステータスが返る' do
        expect(status).to eq 'process'
      end
    end

    context '十分待って結果を取得した場合' do
      before do
        recognition_service.execute
        sleep 10
        rsv= WordService::ResultRequester.new(@image.id)
        @result = rsv.execute
      end

      example '"success"のステータスが返る' do
        expect(status).to eq 'success'
      end

      example '画像のCoordinateが存在する' do
        expect(coordinates.size).to be > 0
      end

      example '画像のWordが存在する' do
        expect(words.size).to be > 0
      end
    end
  end
end
