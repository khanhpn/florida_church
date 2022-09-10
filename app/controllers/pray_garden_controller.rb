class PrayGardenController < ApplicationController
  def index
    @pray_garden = PrayGarden.display_article.last
    @relateds = PrayGarden.where(display: true, is_main_article: false)
  end
end
