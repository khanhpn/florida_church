class EcuharisticMinistryController < ApplicationController
  def index
    @ecuharistic_ministry = EcuharisticMinistry.display_article.last
    @relateds = EcuharisticMinistry.where(display: true, is_main_article: false)
  end
end
