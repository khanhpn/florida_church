class Mass < ApplicationRecord
  belongs_to :user
  has_one_attached :file_attached

  scope :normal_mass, -> {where ticked: false}
  scope :ticked_mass, -> {where ticked: true}
end
