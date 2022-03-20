class SacramentalController < ApplicationController
  def index
    @sacramental = Sacramental.display_article.last
    @relateds = Sacramental.where.not(id: @sacramental)
  end
end
