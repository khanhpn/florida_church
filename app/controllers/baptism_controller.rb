class BaptismController < ApplicationController
  def index
    @baptism = Baptism.display_article.last
    @relateds = Baptism.where(display: true, is_main_article: false)
  end
end
