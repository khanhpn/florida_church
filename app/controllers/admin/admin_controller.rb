class Admin::AdminController < ActionController::Base
  layout 'admin'
  before_action :authenticate_user!
end
