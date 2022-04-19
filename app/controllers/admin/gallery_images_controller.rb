class Admin::GalleryImagesController < Admin::AdminController
  before_action :set_gallery_image, only: [:show, :destroy, :edit, :update]

  def index
    @gallery_images = GalleryImage.all
  end

  def new
    @gallery_image = GalleryImage.new
  end

  def show
  end

  def create
    gallery_image = current_user.gallery_images.new(params_gallery_image)
    if gallery_image.save
      flash[:notice] = 'You created gallery_image successfully'
      redirect_to admin_gallery_image_path(gallery_image)
    else
      flash.now[:warning] = 'You can not create gallery image, please check error'
      render :new
    end
  end

  def update
    if @gallery_image.update(params_gallery_image)
      if params[:gallery_image][:contents].present?
        params[:gallery_image][:contents].each do |image|
          @gallery_image.contents.attach(image)
        end
      end
      flash[:notice] = 'You updated gallery_image successfully'
      redirect_to admin_gallery_image_path(@gallery_image)
    else
      flash.now[:warning] = 'You can not update gallery_image, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @gallery_image.destroy
    flash[:notice] = 'You deleted gallery_image successfully'
    redirect_to admin_gallery_images_path
  end

  def delete_gallery
    @space_image = ActiveStorage::Attachment.find(params[:id])
    @space_image.purge
    @gallery_image = GalleryImage.find_by(id: params[:gallery_id])
    respond_to do |format|
      format.js
    end
  end

  private
  def params_gallery_image
    params.require(:gallery_image).permit(:name, :display_order, :display)
  end

  def set_gallery_image
    @gallery_image = GalleryImage.with_attached_contents.find_by(id: params[:id])
  end
end
