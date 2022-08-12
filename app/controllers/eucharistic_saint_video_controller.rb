class EucharisticSaintVideoController < ApplicationController
  def index
    @eucharistic_saint_video = EucharisticSaintVideo.display_article.last
    @relateds = EucharisticSaintVideo.where(display: true, is_main_article: false)
  end
end
