class WelcomeController < ApplicationController
  def index
    @welcome = Welcome.display_article.last
    @relateds = Welcome.where(display: true, is_main_article: false)
  end
end
