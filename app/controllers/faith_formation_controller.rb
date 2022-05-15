class FaithFormationController < ApplicationController
  def index
    @faith_formation = FaithFormation.display_article.last
    @relateds = FaithFormation.where.not(id: @faith_formation)
  end
end
