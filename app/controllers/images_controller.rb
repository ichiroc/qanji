# frozen_string_literal: true
class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :data]

  def index
    @images = Image.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    image = image_params[:data]
    file_path = ImageService::Resizer.new(image.path).execute
    register = ImageService::Register.new(file_name: image.original_filename,
                                          content_type: image.content_type,
                                          file: File.open(file_path, 'rb').read)
    image = register.execute
    requester = WordService::RecognitionRequester.new(image.id)
    requester.execute
    if image
      redirect_to action: 'show', id: image.id
    else
      flash[:notice] = 'Upload process is failed. Please retry.'
    end
  end

  def data
    send_data @image.data, disposition: :inline, type: @image.content_type
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Nev
  # only allow the white list through.
  def image_params
    params.require(:image).permit(:data)
  end
end
