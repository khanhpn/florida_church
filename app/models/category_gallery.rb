class CategoryGallery < ApplicationRecord
  has_many :photo_galleries, dependent: :destroy
  belongs_to :user
end
