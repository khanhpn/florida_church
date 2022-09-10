class DeaconController < ApplicationController
  def index
    @deacon = Deacon.display_article.last
    @relateds = Deacon.where(display: true, is_main_article: false)
  end
end
