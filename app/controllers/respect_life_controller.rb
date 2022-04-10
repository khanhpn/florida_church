class RespectLifeController < ApplicationController
  def index
    @respect_life = RespectLife.display_article.last
    @relateds = RespectLife.where.not(id: @respect_life)
  end
end
