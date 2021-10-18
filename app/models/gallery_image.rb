class GalleryImage < ApplicationRecord
  has_many_attached :contents
  belongs_to :user

  scope :display_order_top, -> {where(display: true).order(display_order: :asc)}
  scope :display_gallery, -> {where(display: true).order(display_order: :asc)}
end
