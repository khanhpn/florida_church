class BaptismController < ApplicationController
  def index
    @baptism = Baptism.display_article.last
  end
end
