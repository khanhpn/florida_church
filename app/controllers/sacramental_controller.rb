class SacramentalController < ApplicationController
  def index
    @sacramental = Sacramental.display_article.last
    @relateds = Sacramental.where(display: true, is_main_article: false)
  end
end
