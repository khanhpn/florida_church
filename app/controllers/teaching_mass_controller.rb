class TeachingMassController < ApplicationController
  def index
    @teachings = TeachingMass.display_article.last
    @relateds = TeachingMass.where.not(id: @teachings, display: false, is_main_article: true)
  end
end
