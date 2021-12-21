class ClergyController < ApplicationController
  def index
    @clergy = Clergy.display_article.last
  end
end
