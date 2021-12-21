class WelcomeController < ApplicationController
  def index
    @welcome = Welcome.display_article.last
  end
end
