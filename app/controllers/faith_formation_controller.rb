class FaithFormationController < ApplicationController
  def index
    @faith_formation = FaithFormation.display_article.last
    @relateds = FaithFormation.where(display: true, is_main_article: false)
  end
end
