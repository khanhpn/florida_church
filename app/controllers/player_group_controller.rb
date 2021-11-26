class PlayerGroupController < ApplicationController
  def index
    @prayer_group = PrayerGroup.display_article.last
  end
end
