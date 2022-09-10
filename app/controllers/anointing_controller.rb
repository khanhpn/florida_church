class AnointingController < ApplicationController
  def index
    @anointing = AnointingThesick.display_article.last
    @relateds = AnointingThesick.where(display: true, is_main_article: false)
  end
end
