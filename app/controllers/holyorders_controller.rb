class HolyordersController < ApplicationController
  def index
    @holly_order = Holyorder.display_article.last
    @relateds = Holyorder.where(display: true, is_main_article: false)
  end
end
