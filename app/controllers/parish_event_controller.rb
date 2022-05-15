class ParishEventController < ApplicationController
  def index
    @parish_event = ParishEvent.display_article.last
    @relateds = ParishEvent.where.not(id: @parish_event)
  end
end
