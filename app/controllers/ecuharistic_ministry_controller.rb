class EcuharisticMinistryController < ApplicationController
  def index
    @ecuharistic_ministry = EcuharisticMinistry.display_article.last
    @relateds = EcuharisticMinistry.where.not(id: @ecuharistic_ministry)
  end
end
