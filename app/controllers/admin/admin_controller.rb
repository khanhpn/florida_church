class Admin::AdminController < ActionController::Base
  helper_method :current_user
  layout 'admin'
  before_action :authenticate_user!
end
