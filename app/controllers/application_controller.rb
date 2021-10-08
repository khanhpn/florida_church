class ApplicationController < ActionController::Base
  before_action :introduction

  def introduction
    @introduction = Introduction.first
    @linked_logos = LinkedLogo.logo_display&.last(5)
  end
end
