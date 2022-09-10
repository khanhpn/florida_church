class FaithFormationController < ApplicationController
  def index
    @faith_formation = Rails.cache.fetch("faith_formation/last", expires_in: 1.hours) do
      FaithFormation.display_article.last
    end

    @relateds = Rails.cache.fetch("faith_formation/main_article", expires_in: 1.hours) do
      FaithFormation.where(display: true, is_main_article: false)
    end
  end
end
