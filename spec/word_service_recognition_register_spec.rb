# coding: utf-8
require 'rails_helper'

describe WordService::RecognitionRequester do
  before do
    file_path = '/Users/ichiro/dev/qanji/db/seed_data/sample.jpg'
    Image.create(file_name: File.basename(file_path),
                 data: File.new(file_path, 'rb').read,
                 content_type: 'image/jpeg')
  end

  it '登録をすると@jobidが帰る' do
    service = WordService::RecognitionRequester.new(Image.first.id)
    service.execute
  end

  after do
    Image.delete_all
  end

end
