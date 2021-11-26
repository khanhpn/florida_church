class MarriageController < ApplicationController
  def index
    @marriage = Marriage.display_article.last
  end
end
