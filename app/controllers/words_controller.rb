class WordsController < ApplicationController
  def index
    @image = Image.find(params[:image_id])
    unless @image.latest_job_log.status == 'success'
      rreq = WordService::ResultRequester.new(@image.id)
      rreq.execute
    end
    @words = @image.words
  end
end
