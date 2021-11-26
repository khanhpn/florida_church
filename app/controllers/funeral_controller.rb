class FuneralController < ApplicationController
  def index
    @funeral = Funeral.display_article.last
  end
end
