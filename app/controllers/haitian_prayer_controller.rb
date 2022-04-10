class HaitianPrayerController < ApplicationController
  def index
    @haitian_prayer = HaitianPrayer.display_article.last
    @relateds = HaitianPrayer.where.not(id: @haitian_prayer)
  end
end
