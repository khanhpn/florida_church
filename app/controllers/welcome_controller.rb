class WelcomeController < ApplicationController
  def index
    @welcome = Welcome.display_article.last
    @relateds = Welcome.where.not(id: @welcome)
  end
end
