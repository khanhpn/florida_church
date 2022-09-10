class LadiesSaintJohnController < ApplicationController
  def index
    @ladies_saint_john = Rails.cache.fetch("ladies_saint_john/last", expires_in: 1.hours) do
      LadiesSaintJohn.display_article.last
    end

    @relateds = Rails.cache.fetch("ladies_saint_john/main_article", expires_in: 1.hours) do
      LadiesSaintJohn.where(display: true, is_main_article: false)
    end
  end
end
