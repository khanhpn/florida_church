class PlannedGivingController < ApplicationController
  def index
    @planned_giving = PlannedGiving.display_article.last
    @relateds = PlannedGiving.where(display: true, is_main_article: false)
  end
end
