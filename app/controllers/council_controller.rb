class CouncilController < ApplicationController
  def index
    @council = Council.display_article.last
  end
end
