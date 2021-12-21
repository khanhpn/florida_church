class HistoryChurchController < ApplicationController
  def index
    @history_church = HistoryChurch.display_article.last
  end
end
