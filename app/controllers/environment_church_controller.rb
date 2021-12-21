class EnvironmentChurchController < ApplicationController
  def index
    @environment_church = EnvironmentChurch.display_article.last
  end
end
