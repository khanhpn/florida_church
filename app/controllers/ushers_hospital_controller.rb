class UshersHospitalController < ApplicationController
  def index
    @usher = UshersHospitality.display_article.last
    @relateds = UshersHospitality.where.not(id: @usher, display: false, is_main_article: true)
  end
end
