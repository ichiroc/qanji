# frozen_string_literal: true
module ImageService
  class Resizer
    def initialize(file_path, max = 1024)
      @file_path = file_path
      @max = max
    end

    def execute
      mgimg = Magick::ImageList.new(@file_path)
      if mgimg.columns > @max
        mgimg.resize_to_fit!(@max)
        mgimg.write(tmppath)
        @file_path = tmppath
      end
      @file_path
    end

    private

    def tmppath
      Dir::Tmpname.make_tmpname("#{Rails.root}/tmp/resized_image_", extname)
    end

    def extname
      File.extname(@file_path)
    end
  end
end
