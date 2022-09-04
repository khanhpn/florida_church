class EucharisticSaintVideoController < ApplicationController
  def index
    @eucharistic_saint_video = Rails.cache.fetch("eucharistic_saint_video/last", expires_in: 1.hours) do
      EucharisticSaintVideo.display_article.last
    end

    @relateds = Rails.cache.fetch("eucharistic_saint_video/main_article", expires_in: 1.hours) do
      EucharisticSaintVideo.where(display: true, is_main_article: false)
    end
  end
end
