class PhotoGallery < ApplicationRecord
  belongs_to :user
  belongs_to :category_gallery
end
