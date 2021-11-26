class EcuharisticMinistryController < ApplicationController
  def index
    @ecuharistic_ministry = EcuharisticMinistry.display_article.last
  end
end
