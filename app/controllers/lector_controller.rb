class LectorController < ApplicationController
  def index
    @lector = Lector.display_article.last
    @relateds = Lector.where(display: true, is_main_article: false)
  end
end
