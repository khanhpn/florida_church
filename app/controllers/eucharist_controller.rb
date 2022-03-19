class EucharistController < ApplicationController
  def index
    @eucharist = Eucharist.display_article.last
    @relateds = Eucharist.where.not(id: @eucharist, display: false, is_main_article: true)
  end
end
