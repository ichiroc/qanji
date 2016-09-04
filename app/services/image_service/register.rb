# frozen_string_literal: true
module ImageService
  class Register
    def initialize(file_name:, content_type:, file:)
      @file_name = file_name
      @content_type = content_type
      @file = file
    end

    def execute
      Image.create(file_name: @file_name,
                   content_type: @content_type,
                   data: @file)
    end
  end
end
