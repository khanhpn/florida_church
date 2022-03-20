class PlayerGroupController < ApplicationController
  def index
    @prayer_group = PrayerGroup.display_article.last
    @relateds = PrayerGroup.where.not(id: @prayer_group)
  end
end
