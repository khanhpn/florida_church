class EucharistController < ApplicationController
  def index
    @eucharist = Eucharist.display_article.last
  end
end
