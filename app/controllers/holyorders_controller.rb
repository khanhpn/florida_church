class HolyordersController < ApplicationController
  def index
    @holly_order = Holyorder.display_article.last
  end
end
