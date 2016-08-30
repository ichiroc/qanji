# coding: utf-8
module WordService
  class Translator
    MS_CLIENT_ID     = Rails.application.secrets.microsoft['client_id']
    MS_CLIENT_SECRET = Rails.application.secrets.microsoft['client_secret']
    def initialize(word_id)
      @word = Word.find(word_id)
    end

    def execute
      if @word.english.blank?
        t = MicrosoftTranslator::Client.new(MS_CLIENT_ID, MS_CLIENT_SECRET)
        english = t.translate(@word.text, 'ja', 'en', 'text/html')
        # Callback loop を避ける為に update_column を使用
        @word.update_column(:english, english)
      end
      @word.english
    end
  end
end
