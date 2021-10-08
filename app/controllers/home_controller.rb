class HomeController < ApplicationController
  def index
    @masses = Mass.normal_mass.last(4)
    @mass_ticked = Mass.ticked_mass.last
  end
end
