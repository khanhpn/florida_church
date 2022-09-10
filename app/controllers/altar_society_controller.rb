class AltarSocietyController < ApplicationController
  def index
    @altar_society = AltarSociety.display_article.last
    @relateds = AltarSociety.where(display: true, is_main_article: false)
  end
end
