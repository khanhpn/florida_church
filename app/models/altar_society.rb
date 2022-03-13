class AltarSociety < ApplicationRecord
  has_one_attached :file_image
  has_one_attached :file_pdf

  belongs_to :user
  has_many :worships, as: :worshipable
  scope :display_article, -> {where(display: true, is_main_article: true)}
end
