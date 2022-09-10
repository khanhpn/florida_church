class ClergyController < ApplicationController
  def index
    @clergy = Clergy.display_article.last
    @relateds = Clergy.where(display: true, is_main_article: false)
  end
end
