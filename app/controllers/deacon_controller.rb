class DeaconController < ApplicationController
  def index
    @deacon = Deacon.display_article.last
  end
end
