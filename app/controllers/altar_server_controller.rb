class AltarServerController < ApplicationController
  def index
    @altar_servers = AltarServer.display_article
  end
end
