class YouthController < ApplicationController
  def index
    @youth = Youth.display_article.last
    @relateds = Youth.where.not(id: @youth)
  end
end
