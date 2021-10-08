class LinkedLogo < ApplicationRecord
  belongs_to :user
  has_one_attached :logo_linked

  scope :logo_display, -> {where display: true}
end
