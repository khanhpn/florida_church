class Admin::LectorController < Admin::AdminController
  before_action :set_lector, only: [:destroy, :edit, :update, :show]

  def index
    @lectors = Lector.all
  end

  def new
    @is_main_article = Lector.find_by(is_main_article: true)
    @lector = Lector.new
  end

  def show
    @is_main_article = @lector.is_main_article
  end

  def create
    lector = current_user.lectors.new(params_lector)
    if lector.save
      flash[:notice] = 'You created lector successfully'
      redirect_to admin_lector_index_path
    else
      flash.now[:warning] = 'You can not create lector, please check error'
      render :new
    end
  end

  def update
    if @lector.update(params_lector)
      flash[:notice] = 'You updated lector successfully'
      redirect_to admin_lector_index_path
    else
      flash.now[:warning] = 'You can not update lector, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = @lector.is_main_article
  end

  def destroy
    @lector.destroy
    flash[:notice] = 'You deleted lector successfully'
    redirect_to admin_lector_index_path
  end

  private
  def params_lector
    params.require(:lector).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_lector
    @lector = Lector.find_by(id: params[:id])
  end
end
