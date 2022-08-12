class AltarServerController < ApplicationController
  def index
    @altar_server = AltarServer.display_article.last
    @relateds = AltarServer.where(display: true, is_main_article: false)
  end

  def show
    @altar_server = AltarServer.find_by(id: params[:id])
  end
end
