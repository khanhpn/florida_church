class PrayGardenController < ApplicationController
  def index
    @pray_garden = PrayGarden.display_article.last
    @relateds = PrayGarden.where.not(id: @pray_garden)
  end
end
