#-*- coding:utf-8 -*-
module WordService
  class ResultRequester
    include WordService::Base
    API_URL_BASE_PATH = '/characterRecognition/v1/scene'.freeze

    def initialize(image_id)
      @image = Image.find(image_id)
      @api_url_path = "#{API_URL_BASE_PATH}/#{@image.latest_job_log.key}?APIKEY=#{API_KEY}"
    end

    def execute
      response = Faraday.get "#{API_BASE_URL}/#{@api_url_path}"
      result = JSON.parse(response.body)
      message = result['message'] || ''
      log = JobLog.new(
        key: result.dig('job', '@id'), status: result.dig('job', '@status'),
        queue_time: Time.parse(result.dig('job', '@queue-time')),
        message: message, raw_text: response.body.force_encoding('UTF-8'),
        image: @image
      )
      log.save

      if result['job']['@status'] == 'success'
        result['words']['word'].each do |json|
          word = Word.create(text: json['@text'],
                             score: json['@score'],
                             category: json['@category'],
                             image: @image)
          json['shape']['point'].each do |point|
            Coordinate.create(x: point['@x'], y: point['@y'], word: word)
          end
        end
      end
      result
    end
  end
end
