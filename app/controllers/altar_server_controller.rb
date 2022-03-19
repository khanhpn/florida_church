class AltarServerController < ApplicationController
  def index
    @altar_server = AltarServer.display_article.last
    @relateds = AltarServer.where.not(id: @altar_server, display: false, is_main_article: true)
  end

  def show
    @altar_server = AltarServer.find_by(id: params[:id])
  end
end
