class LectorController < ApplicationController
  def index
    @lector = Lector.display_article.last
    @relateds = Lector.where.not(id: @lector)
  end
end
