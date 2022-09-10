class UshersHospitalController < ApplicationController
  def index
    @usher = UshersHospitality.display_article.last
    @relateds = UshersHospitality.where(display: true, is_main_article: false)
  end
end
