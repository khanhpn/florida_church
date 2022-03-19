class FuneralController < ApplicationController
  def index
    @funeral = Funeral.display_article.last
    @relateds = Funeral.where.not(id: @funeral, display: false, is_main_article: true)
  end
end
