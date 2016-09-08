# frozen_string_literal: true
module ImageService
  class Register
    def initialize(file_name:, content_type:, file:)
      @file_name = file_name
      @content_type = content_type
      @file = file
    end

    def execute
      file_name = "#{Rails.root}/tmp/image-wh-#{@file_name}"
      File.open(file_name, 'wb').write(@file)
      img = Magick::ImageList.new(file_name)
      Image.create(file_name: @file_name,
                   content_type: @content_type,
                   width: img.columns,
                   height: img.rows,
                   data: @file)
    end
  end
end
