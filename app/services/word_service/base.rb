module WordService
  module Base
    API_KEY = Rails.application.secrets.docomo_api_key
    API_BASE_URL = 'https://api.apigw.smt.docomo.ne.jp'.freeze
  end
end
