class HospitalVisitController < ApplicationController
  def index
    @hospital_visit = HospitalVisit.display_article.last
    @relateds = HospitalVisit.where.not(id: @hospital_visit)
  end
end
