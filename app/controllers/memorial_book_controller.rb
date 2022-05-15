class MemorialBookController < ApplicationController
  def index
    @memorial_book = MemorialBook.display_article.last
    @relateds = MemorialBook.where.not(id: @memorial_book)
  end
end
