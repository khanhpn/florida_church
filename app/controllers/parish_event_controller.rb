class ParishEventController < ApplicationController
  def index
    @parish_event = ParishEvent.display_article.last
    @relateds = ParishEvent.where(display: true, is_main_article: false)
  end
end
