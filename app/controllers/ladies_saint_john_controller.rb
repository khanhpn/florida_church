class LadiesSaintJohnController < ApplicationController
  def index
    @ladies_saint_john = LadiesSaintJohn.display_article.last
    @relateds = LadiesSaintJohn.where(display: true, is_main_article: false)
  end
end
