class AnointingController < ApplicationController
  def index
    @anointing = AnointingThesick.display_article.last
  end
end
