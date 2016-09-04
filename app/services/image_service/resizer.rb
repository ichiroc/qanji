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
        path = Dir::Tmpname.make_tmpname("#{Rails.root}/tmp/resized_image_", ".jpg" )
        mgimg.write(path)
        @file_path = path
      end
      @file_path
    end
  end
end
