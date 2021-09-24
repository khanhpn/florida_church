class ApplicationController < ActionController::Base
  before_action :introduction

  def introduction
    @introduction = Introduction.first
  end
end
