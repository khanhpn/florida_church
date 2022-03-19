class AnointingController < ApplicationController
  def index
    @anointing = AnointingThesick.display_article.last
    @relateds = AnointingThesick.where.not(id: @anointing, display: false, is_main_article: true)
  end
end
