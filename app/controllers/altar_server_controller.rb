class AltarServerController < ApplicationController
  def index
    @altar_server = AltarServer.display_article.last
  end
end
