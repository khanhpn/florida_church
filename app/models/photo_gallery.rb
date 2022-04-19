class PhotoGallery < ApplicationRecord
  belongs_to :category_gallery

  has_one_attached :file_image
end
