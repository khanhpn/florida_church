class PlayerGroupController < ApplicationController
  def index
    @prayer_group = PrayerGroup.display_article.last
    @relateds = PrayerGroup.where(display: true, is_main_article: false)
  end
end
