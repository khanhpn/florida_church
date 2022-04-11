class KnightColumbController < ApplicationController
  def index
    @knight_columb = KnightColumb.display_article.last
    @relateds = KnightColumb.where.not(id: @knight_columb)
  end
end
