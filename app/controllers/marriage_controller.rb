class MarriageController < ApplicationController
  def index
    @marriage = Marriage.display_article.last
    @relateds = Marriage.where.not(id: @marriage, display: false, is_main_article: true)
  end
end
