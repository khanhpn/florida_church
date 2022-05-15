class AltarSocietyController < ApplicationController
  def index
    @altar_society = AltarSociety.display_article.last
    @relateds = AltarSociety.where.not(id: @altar_society)
  end
end
