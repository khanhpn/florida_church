class WomenGrace < ApplicationRecord
  has_one_attached :file_image
  has_one_attached :file_pdf

  scope :display_article, -> {where(display: true, is_main_article: true)}
end
