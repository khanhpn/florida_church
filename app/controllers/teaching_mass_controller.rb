class TeachingMassController < ApplicationController
  def index
    @teachings = TeachingMass.display_teaching_mass
  end
end
