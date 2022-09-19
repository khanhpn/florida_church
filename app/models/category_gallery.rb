class CategoryGallery < ApplicationRecord
  has_many :photo_galleries, dependent: :destroy
  belongs_to :user

  has_one_attached :file_image

  validates :link_google_photo, presence: true, if: -> { enable_google_photo }
  validates :name, presence: true
end
