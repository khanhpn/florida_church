class MemorialBookController < ApplicationController
  def index
    @memorial_book = MemorialBook.display_article.last
    @relateds = MemorialBook.where(display: true, is_main_article: false)
  end
end
