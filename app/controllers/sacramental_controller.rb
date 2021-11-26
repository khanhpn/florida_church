class SacramentalController < ApplicationController
  def index
    @sacramental = Sacramental.display_article.last
  end
end
