# coding: utf-8
# frozen_string_literal: true
require 'rails_helper'

RSpec.describe WordService::Translator do
  let(:file_path) { "#{Rails.root}/db/seed_data/sample.jpg" }
  let(:image) do
    Image.create(file_name: File.basename(file_path),
                 data: File.new(file_path, 'rb').read,
                 content_type: 'image/jpeg')
  end
  let(:word_id) { Word.find_or_create_by(text: '山', score: '1.0', image: image).id }
  let(:translated_text) do
    WordService::Translator.new(word_id).execute
    Word.find(word_id).english
  end

  describe '#execute' do
    example '日本語を英語に翻訳できる' do
      expect(translated_text).to eq 'Mountain'
    end
  end
end
