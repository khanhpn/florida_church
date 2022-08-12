class CouncilController < ApplicationController
  def index
    @council = Council.display_article.last
    @relateds = Council.where(display: true, is_main_article: false)
  end
end
