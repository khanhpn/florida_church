class StaffController < ApplicationController
  def index
    @staff = Staff.display_article.last
  end
end
