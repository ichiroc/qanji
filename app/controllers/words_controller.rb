# coding: utf-8
# frozen_string_literal: true
class WordsController < ApplicationController
  def index
    @image = Image.find(params[:image_id])
    # FIXME: 二回リクエストがあった時にwordsを処理中の場合 success かつ words 0 で返してしまう
    unless @image.latest_job_log.status == 'success'
      rreq = WordService::ResultRequester.new(@image.id)
      rreq.execute
    end
    @status = @image.latest_job_log.status
  end
end
