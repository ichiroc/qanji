# coding: utf-8
require "rails_helper"

RSpec.describe ImageService::Register do
  describe '#execute' do
    let(:file_name) { 'hoge.jpg' }
    let(:content_type) { 'image/jpg' }
    let(:full_file_path) { "#{Rails.root}/test/fixtures/files/sample.jpg" }
    let(:image_data) { File.open(full_file_path, 'rb').read }
    let(:service) do
      ImageService::Register.new(file_name: file_name,
                                 content_type: content_type,
                                 data: image_data)

    end

    example 'イメージが登録出来る' do
      image = service.execute
      expect(image).to be_an_instance_of Image # Image のインスタンス
    end

  end
end
