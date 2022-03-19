class SacramentalController < ApplicationController
  def index
    @sacramental = Sacramental.display_article.last
    @relateds = Sacramental.where.not(id: @sacramental, display: false, is_main_article: true)
  end
end
