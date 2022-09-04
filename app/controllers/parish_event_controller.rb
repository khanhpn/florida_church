class ParishEventController < ApplicationController
  def index
    @parish_event = Rails.cache.fetch("parish_event/display_article/last", expires_in: 1.hours) do
      ParishEvent.display_article.last
    end

    @relateds = Rails.cache.fetch("parish_event/display_article/related", expires_in: 1.hours) do
      ParishEvent.where(display: true, is_main_article: false).to_a
    end
  end
end
