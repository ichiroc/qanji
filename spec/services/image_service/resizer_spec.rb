# coding: utf-8
require "rails_helper"

RSpec.describe ImageService::Resizer do
  describe '#execute' do
    let(:file_name) { "#{Rails.root}/test/fixtures/files/big.jpg" }
    example '4096を越える画像の場合は1024に縮小される' do
      img = File.open(file_name, 'rb')
      rim = Magick::ImageList.new(img)
      expect(rim.columns).to be > 1024
      resizer = ImageService::Resizer.new(file_name)
      im = resizer.execute
      expect(im.columns).to be 1024
    end
  end
end
