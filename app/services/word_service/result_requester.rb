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
      if @image.latest_job_log.status == 'success'
        return true # JSON.parse(@image.latest_job_log.raw_text)
      end
      response = Faraday.get "#{API_BASE_URL}/#{@api_url_path}"
      parse_and_register response
    end

    private

    def parse_and_register(response)
      json = JSON.parse(response.body)
      register_job_logs json
      register_words json
    end

    def register_job_logs(json)
      return @image.latest_job_log if @image.latest_job_log.status == 'success'
      JobLog.create(
        key: json.dig('job', '@id'),
        status: json.dig('job', '@status'),
        queue_time: Time.parse(json.dig('job', '@queue-time')),
        message: json['message'],
        raw_text: json.to_s,
        image: @image
      )
    end

    def register_words(json)
      return @image.words if @image.latest_job_log.status == 'success'
      if json.dig('job', '@status') == 'success'
        json.dig('words', 'word').each do |wd|
          word = Word.create(text: wd['@text'],
                             score: wd['@score'],
                             category: wd['@category'],
                             image: @image)
          register_coordinates(word, wd)
        end
      end
      @image.words
    end

    def register_coordinates(word, json)
      json['shape']['point'].each do |point|
        Coordinate.create(x: point['@x'], y: point['@y'], word: word)
      end
    end
  end
end
