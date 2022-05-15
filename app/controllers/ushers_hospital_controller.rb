class UshersHospitalController < ApplicationController
  def index
    @usher = UshersHospitality.display_article.last
    @relateds = UshersHospitality.where.not(id: @usher)
  end
end
