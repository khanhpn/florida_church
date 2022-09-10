class EnvironmentChurchController < ApplicationController
  def index
    @environment_church = EnvironmentChurch.display_article.last
    @relateds = EnvironmentChurch.where(display: true, is_main_article: false)
  end
end
