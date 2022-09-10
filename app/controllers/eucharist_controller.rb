class EucharistController < ApplicationController
  def index
    @eucharist = Eucharist.display_article.last
    @relateds = Eucharist.where(display: true, is_main_article: false)
  end
end
