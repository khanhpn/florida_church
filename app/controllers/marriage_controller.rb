class MarriageController < ApplicationController
  def index
    @marriage = Marriage.display_article.last
    @relateds = Marriage.where(display: true, is_main_article: false)
  end
end
