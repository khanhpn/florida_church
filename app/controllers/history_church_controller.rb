class HistoryChurchController < ApplicationController
  def index
    @history_church = HistoryChurch.display_article.last
    @relateds = HistoryChurch.where(display: true, is_main_article: false)
  end
end
