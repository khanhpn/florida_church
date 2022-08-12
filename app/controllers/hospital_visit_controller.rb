class HospitalVisitController < ApplicationController
  def index
    @hospital_visit = HospitalVisit.display_article.last
    @relateds = HospitalVisit.where(display: true, is_main_article: false)
  end
end
