class EucharistController < ApplicationController
  def index
    @eucharist = Eucharist.display_article.last
    @relateds = Eucharist.where.not(id: @eucharist)
  end
end
