class ApplicationController < ActionController::Base
  before_action :introduction

  def introduction
    @introduction = Rails.cache.fetch("introduction/first", expires_in: 1.hours) do
      Introduction.first
    end

    @linked_logos = Rails.cache.fetch("linked_logo/last_five", expires_in: 1.hours) do
      LinkedLogo.logo_display&.last(5)
    end
  end
end
