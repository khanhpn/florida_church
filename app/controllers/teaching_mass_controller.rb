class TeachingMassController < ApplicationController
  def index
    @teachings = TeachingMass.display_article.last
    @relateds = TeachingMass.where.not(id: @teachings)
  end
end
