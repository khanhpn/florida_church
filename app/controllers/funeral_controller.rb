class FuneralController < ApplicationController
  def index
    @funeral = Funeral.display_article.last
    @relateds = Funeral.where(display: true, is_main_article: false)
  end
end
