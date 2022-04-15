class Admin::CategoryGalleryController < Admin::AdminController
  before_action :set_category_gallery, only: [:destroy, :edit, :update, :show]

  def index
    @category_galleries = CategoryGallery.all
  end

  def new
    @category_gallery = CategoryGallery.new
  end

  def show
  end

  def create
    category_gallery = current_user.category_galleries.new(params_category_gallery)
    if category_gallery.save
      flash[:notice] = 'You created category gallery successfully'
      redirect_to admin_category_gallery_index_path
    else
      flash.now[:warning] = 'You can not create category gallery, please check error'
      render :new
    end
  end

  def update
    if @category_gallery.update(params_category_gallery)
      flash[:notice] = 'You updated category gallery successfully'
      redirect_to admin_category_gallery_index_path
    else
      flash.now[:warning] = 'You can not update category gallery, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @category_gallery.destroy
    flash[:notice] = 'You deleted category gallery successfully'
    redirect_to admin_category_gallery_index_path
  end

  private
  def params_category_gallery
    params.require(:category_gallery).permit(:name, :display)
  end

  def set_category_gallery
    @category_gallery = CategoryGallery.find_by(id: params[:id])
  end
end
