class HaitianPrayerController < ApplicationController
  def index
    @haitian_prayer = HaitianPrayer.display_article.last
    @relateds = HaitianPrayer.where(display: true, is_main_article: false)
  end
end
