class HolyordersController < ApplicationController
  def index
    @holly_order = Holyorder.display_article.last
    @relateds = Holyorder.where.not(id: @holly_order)
  end
end
