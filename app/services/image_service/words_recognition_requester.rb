module ImageService
  class WordsRecognitionRequester
    BASE_URL = 'https://api.apigw.smt.docomo.ne.jp/characterRecognition/v1/scene'.freeze
    def initialize(image_id)
      @image_id = image_id
    end

    def execute

    end
  end
end
