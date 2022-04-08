class HistoryChurchController < ApplicationController
  def index
    @history_church = HistoryChurch.display_article.last
    @relateds = HistoryChurch.where.not(id: @history_church)
  end
end
