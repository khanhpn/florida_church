class TeachingMassController < ApplicationController
  def index
    @teachings = Teaching.display_teaching_mass
  end
end
