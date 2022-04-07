class Admin::FuneralController < Admin::AdminController
  before_action :set_funeral, only: [:destroy, :edit, :update, :show]

  def index
    @funerals = Funeral.all
  end

  def new
    @is_main_article = Funeral.find_by(is_main_article: true)
    @funeral = Funeral.new
  end

  def show
    @is_main_article = @funeral.is_main_article
  end

  def create
    funeral = current_user.funerals.new(params_funeral)
    if funeral.save
      flash[:notice] = 'You created funeral successfully'
      redirect_to admin_funeral_index_path
    else
      flash.now[:warning] = 'You can not create funeral, please check error'
      render :new
    end
  end

  def update
    if @funeral.update(params_funeral)
      flash[:notice] = 'You updated funeral successfully'
      redirect_to admin_funeral_index_path
    else
      flash.now[:warning] = 'You can not update funeral, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Funeral.find_by(is_main_article: true)
  end

  def destroy
    @funeral.destroy
    flash[:notice] = 'You deleted funeral successfully'
    redirect_to admin_funeral_index_path
  end

  private
  def params_funeral
    params.require(:funeral).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_funeral
    @funeral = Funeral.find_by(id: params[:id])
  end
end
