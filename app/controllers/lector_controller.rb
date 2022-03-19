class LectorController < ApplicationController
  def index
    @lector = Lector.display_article.last
    @relateds = Lector.where.not(id: @lector, display: false, is_main_article: true)
  end
end
