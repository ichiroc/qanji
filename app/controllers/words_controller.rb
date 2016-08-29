class WordsController < ApplicationController
  def index
    @image = Image.find(params[:image_id])
    rreq = WordService::ResultRequester.new(@image.id)
    rreq.execute
    @words = @image.words
  end
end
