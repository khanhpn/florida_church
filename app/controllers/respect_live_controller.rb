class RespectLiveController < ApplicationController
  def index
    @respect_live = RespectLife.display_article.last
    @relateds = RespectLife.where.not(id: @respect_live)
  end
end
