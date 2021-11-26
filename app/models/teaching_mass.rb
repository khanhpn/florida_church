class TeachingMass < ApplicationRecord
  belongs_to :user
  scope :display_teaching_mass, -> {where(display: true)}
end
