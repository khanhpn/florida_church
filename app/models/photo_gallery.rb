class PhotoGallery < ApplicationRecord
  belongs_to :category_gallery

  has_one_attached :file_image
  validates :file_image, presence: true
end
