class Admin::SacramentalController < Admin::AdminController
  before_action :set_sacramental, only: [:destroy, :edit, :update, :show]

  def index
    @sacramentals = Sacramental.all
  end

  def new
    @is_main_article = Sacramental.find_by(is_main_article: true)
    @sacramental = Sacramental.new
  end

  def show
    @is_main_article = @sacramental.is_main_article
  end

  def create
    sacramental = current_user.sacramentals.new(params_sacramental)
    if sacramental.save
      flash[:notice] = 'You created sacramental successfully'
      redirect_to admin_sacramental_index_path
    else
      flash.now[:warning] = 'You can not create sacramental, please check error'
      render :new
    end
  end

  def update
    if @sacramental.update(params_sacramental)
      flash[:notice] = 'You updated sacramental successfully'
      redirect_to admin_sacramental_index_path
    else
      flash.now[:warning] = 'You can not update sacramental, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Sacramental.find_by(is_main_article: true)
  end

  def destroy
    @sacramental.destroy
    flash[:notice] = 'You deleted sacramental successfully'
    redirect_to admin_sacramental_index_path
  end

  private
  def params_sacramental
    params.require(:sacramental).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_sacramental
    @sacramental = Sacramental.find_by(id: params[:id])
  end
end
