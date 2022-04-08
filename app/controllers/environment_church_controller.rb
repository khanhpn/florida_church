class EnvironmentChurchController < ApplicationController
  def index
    @environment_church = EnvironmentChurch.display_article.last
    @relateds = EnvironmentChurch.where.not(id: @environment_church)
  end
end
