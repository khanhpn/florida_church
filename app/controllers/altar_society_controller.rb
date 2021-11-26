class AltarSocietyController < ApplicationController
  def index
    @altar_society = AltarSociety.display_article.last
  end
end
