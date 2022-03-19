class BaptismController < ApplicationController
  def index
    @baptism = Baptism.display_article.last
    @relateds = Baptism.where.not(id: @baptism, display: false, is_main_article: true)
  end
end
