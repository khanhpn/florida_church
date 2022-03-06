class TeachingMass < ApplicationRecord
  belongs_to :user
  has_many :worships, as: :worshipable
  scope :display_teaching_mass, -> {where(display: true)}
end
