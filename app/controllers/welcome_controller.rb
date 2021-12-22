class WelcomeController < ApplicationController
  def index
    @welcome = Welcome.last
  end
end
