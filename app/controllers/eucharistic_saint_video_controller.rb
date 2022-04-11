class EucharisticSaintVideoController < ApplicationController
  def index
    @eucharistic_saint_video = EucharisticSaintVideo.display_article.last
    @relateds = EucharisticSaintVideo.where.not(id: @eucharistic_saint_video)
  end
end
