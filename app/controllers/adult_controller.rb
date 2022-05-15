class AdultController < ApplicationController
  def index
    @adult = Adult.display_article.last
    @relateds = Adult.where.not(id: @adult)
  end
end
