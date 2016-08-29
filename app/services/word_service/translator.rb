module WordService
  class Translator
    MS_CLIENT_ID     = Rails.application.secrets.microsoft['client_id']
    MS_CLIENT_SECRET = Rails.application.secrets.microsoft['client_secret']
    def initialize(word_id)
      @word = Word.find(word_id)
    end

    def execute
      translator = MicrosoftTranslator::Client.new(MS_CLIENT_ID, MS_CLIENT_SECRET)
      english = translator.translate(@word.text, 'ja', 'en', 'text/html')
      @word.update(english: english)
    end
  end
end
