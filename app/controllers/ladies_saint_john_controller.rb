class LadiesSaintJohnController < ApplicationController
  def index
    @ladies_saint_john = LadiesSaintJohn.display_article.last
    @relateds = LadiesSaintJohn.where.not(id: @ladies_saint_john)
  end
end
