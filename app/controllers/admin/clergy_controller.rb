class Admin::ClergyController < Admin::AdminController
  before_action :set_clergy, only: [:destroy, :edit, :update, :show]

  def index
    @clergies = Clergy.all
  end

  def new
    @is_main_article = Clergy.find_by(is_main_article: true)
    @clergy = Clergy.new
  end

  def show
    @is_main_article = @clergy.is_main_article
  end

  def create
    clergy = current_user.clergies.new(params_clergy)
    if clergy.save
      flash[:notice] = 'You created clergy successfully'
      redirect_to admin_clergy_index_path
    else
      flash.now[:warning] = 'You can not create clergy, please check error'
      render :new
    end
  end

  def update
    if @clergy.update(params_clergy)
      flash[:notice] = 'You updated clergy successfully'
      redirect_to admin_clergy_index_path
    else
      flash.now[:warning] = 'You can not update clergy, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Clergy.find_by(is_main_article: true)
  end

  def destroy
    @clergy.destroy
    flash[:notice] = 'You deleted clergy successfully'
    redirect_to admin_clergy_index_path
  end

  private
  def params_clergy
    params.require(:clergy).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_clergy
    @clergy = Clergy.find_by(id: params[:id])
  end
end
