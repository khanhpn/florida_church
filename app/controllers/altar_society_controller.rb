class AltarSocietyController < ApplicationController
  def index
    @altar_society = AltarSociety.display_article.last
    @relateds = AltarSociety.where.not(id: @altar_society, display: false, is_main_article: true)
  end
end
