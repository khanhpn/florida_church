class KnightColumbController < ApplicationController
  def index
    @knight_columb = KnightColumb.display_article.last
    @relateds = KnightColumb.where(display: true, is_main_article: false)
  end
end
