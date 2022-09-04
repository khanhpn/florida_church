class KnightColumbController < ApplicationController
  def index
    @knight_columb = Rails.cache.fetch("knight_columb/main_article", expires_in: 1.hours) do
      KnightColumb.display_article.last
    end

    @relateds = Rails.cache.fetch("knight_columb/main_article", expires_in: 1.hours) do
      KnightColumb.where(display: true, is_main_article: false)
    end
  end
end
