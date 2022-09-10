class TeachingMassController < ApplicationController
  def index
    @teachings = TeachingMass.display_article.last
    @relateds = TeachingMass.where(display: true, is_main_article: false)
  end
end
