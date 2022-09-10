class WomenGraceController < ApplicationController
  def index
    @women_grace = WomenGrace.display_article.last
    @relateds = WomenGrace.where(display: true, is_main_article: false)
  end
end
