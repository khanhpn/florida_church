class StaffController < ApplicationController
  def index
    @staff = Staff.display_article.last
    @relateds = Staff.where(display: true, is_main_article: false)
  end
end
