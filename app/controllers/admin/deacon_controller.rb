class Admin::DeaconController < Admin::AdminController
  before_action :set_deacon, only: [:destroy, :edit, :update, :show]

  def index
    @deacons = Deacon.all
  end

  def new
    @is_main_article = Deacon.find_by(is_main_article: true)
    @deacon = Deacon.new
  end

  def show
    @is_main_article = @deacon.is_main_article
  end

  def create
    deacon = current_user.deacons.new(params_deacon)
    if deacon.save
      flash[:notice] = 'You created deacon successfully'
      redirect_to admin_deacon_index_path
    else
      flash.now[:warning] = 'You can not create deacon, please check error'
      render :new
    end
  end

  def update
    if @deacon.update(params_deacon)
      flash[:notice] = 'You updated deacon successfully'
      redirect_to admin_deacon_index_path
    else
      flash.now[:warning] = 'You can not update deacon, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Deacon.find_by(is_main_article: true)
  end

  def destroy
    @deacon.destroy
    flash[:notice] = 'You deleted deacon successfully'
    redirect_to admin_deacon_index_path
  end

  private
  def params_deacon
    params.require(:deacon).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_deacon
    @deacon = Deacon.find_by(id: params[:id])
  end
end
