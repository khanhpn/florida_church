class Admin::DashboardController < Admin::AdminController
  def index
    @introduction = Introduction.first
  end
end
