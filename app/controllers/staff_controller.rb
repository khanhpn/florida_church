class StaffController < ApplicationController
  def index
    @staff = Staff.display_article.last
    @relateds = Staff.where.not(id: @staff)
  end
end
