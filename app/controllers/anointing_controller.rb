class AnointingController < ApplicationController
  def index
    @anointing = AnointingThesick.display_article.last
    @relateds = AnointingThesick.where.not(id: @anointing)
  end
end
