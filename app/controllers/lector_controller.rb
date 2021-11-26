class LectorController < ApplicationController
  def index
    @lector = Lector.display_article.last
  end
end
