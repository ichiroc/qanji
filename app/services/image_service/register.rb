module ImageService
  class Register
    def initialize(upload_file)
      @upload_file = upload_file
    end

    def execute
      Image.create(file_name: @upload_file.original_filename,
                   content_type: @upload_file.content_type,
                   data: @upload_file.read)
    end
  end
end
