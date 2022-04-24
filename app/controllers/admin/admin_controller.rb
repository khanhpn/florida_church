class Admin::AdminController < ActionController::Base
  helper_method :current_user
  layout 'admin'
  before_action :authenticate_user!

  def check_permission_admin?
    current_user.super_admin? || current_user.admin?
  end
end
