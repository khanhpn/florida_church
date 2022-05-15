class WomenGraceController < ApplicationController
  def index
    @women_grace = WomenGrace.display_article.last
    @relateds = WomenGrace.where.not(id: @women_grace)
  end
end
