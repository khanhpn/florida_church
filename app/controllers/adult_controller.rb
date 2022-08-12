class AdultController < ApplicationController
  def index
    @adult = Adult.display_article.last
    @relateds = Adult.where(display: true, is_main_article: false)
  end
end
