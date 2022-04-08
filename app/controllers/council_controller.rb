class CouncilController < ApplicationController
  def index
    @council = Council.display_article.last
    @relateds = Council.where.not(id: @council)
  end
end
