class UshersHospitalController < ApplicationController
  def index
    @usher = UshersHospitality.display_article.last
  end
end
