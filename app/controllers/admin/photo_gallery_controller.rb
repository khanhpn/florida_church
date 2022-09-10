class Admin::PhotoGalleryController < Admin::AdminController
  before_action :set_photo_galleries, only: [:delete_gallery]

  def new
    @photo_gallery = CategoryGallery.find_by(id: params[:category_gallery_id]).photo_galleries.new
  end

  def create
    gallery_image = CategoryGallery.find_by(id: params[:category_gallery_id]).photo_galleries.new(set_params)
    if gallery_image.save
      flash[:notice] = 'You created gallery image successfully'
      redirect_to admin_category_gallery_path(params[:category_gallery_id])
    else
      flash.now[:warning] = 'You can not create gallery image, please check error'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def delete_gallery
    gallery = @photo_galleries.find_by(id: params[:id])

    ActiveRecord::Base.transaction do
      @space_image = ActiveStorage::Attachment.find(gallery.file_image&.id)
      @space_image.purge
      gallery.destroy
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_photo_galleries
    @photo_galleries = CategoryGallery.find_by(id: params[:category_id]).photo_galleries
  end

  def set_params
    params.require(:photo_gallery).permit(:name, :file_image)
  end
end
