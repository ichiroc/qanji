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
    image_register = ImageService::Register.new(image_params[:data])
    image = image_register.execute
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

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def image_params
    params.require(:image).permit(:data)
  end
end
