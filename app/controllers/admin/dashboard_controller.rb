class Admin::DashboardController < Admin::AdminController
  def index
    @introduction = Introduction.first
    @users = User.all
  end
end
