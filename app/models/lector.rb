class Lector < ApplicationRecord
  belongs_to :user
  has_many :worships, as: :worshipable
  scope :display_article, -> {where(display: true)}
end
