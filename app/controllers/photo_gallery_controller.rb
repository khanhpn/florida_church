class PhotoGalleryController < ApplicationController
  def index
    @category_galleries = CategoryGallery.includes(:photo_galleries).where(display: true)
  end

  def show
    @category_gallery = CategoryGallery.find_by(id: params[:id])
    @photo_galleries = @category_gallery.photo_galleries
  end
end
