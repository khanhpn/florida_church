class RespectLifeController < ApplicationController
  def index
    @respect_life = RespectLife.display_article.last
    @relateds = RespectLife.where(display: true, is_main_article: false)
  end
end
