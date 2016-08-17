# WordService
require 'faraday'
require 'json'
require 'time'

module WordService
  class RecognitionRequester
    API_KEY = Rails.application.secrets.docomo_api_key
    API_BASE_URL = 'https://api.apigw.smt.docomo.ne.jp'.freeze
    API_URL_PATH = "/characterRecognition/v1/scene?APIKEY=#{API_KEY}".freeze

    def initialize(image_id)
      @image = Image.find(image_id)
      @conn = Faraday.new API_BASE_URL do |builder|
        builder.request :multipart
        builder.adapter Faraday.default_adapter
      end
    end

    def execute
      response = @conn.post API_URL_PATH, image: faraday_upload_io
      json = JSON.parse(response.body)
      log = JobLog.new(
        key: json.dig('job', '@id'), status: json.dig('job', '@status'),
        queue_time: Time.parse(json.dig('job', '@queue-time')),
        message: json['message'], raw_text: response.body,
        image: @image
      )
      log.save ? log : false
    end

    private

    def faraday_upload_io
      tmp_file_path = "#{Rails.root}/tmp/imaage_#{@image.id}.jpg"
      File.open(tmp_file_path, 'wb') do |file|
        file.write @image.data
      end
      Faraday::UploadIO.new(tmp_file_path, @image.content_type)
    end
  end
end
