class Admin::YouthController < Admin::AdminController
  before_action :set_youth, only: [:destroy, :edit, :update, :show]

  def index
    @youths = Youth.all
  end

  def new
    @is_main_article = Youth.find_by(is_main_article: true)
    @youth = Youth.new
  end

  def show
    @is_main_article = @youth.is_main_article
  end

  def create
    youth = current_user.youths.new(params_youth)
    if youth.save
      flash[:notice] = 'You created youth successfully'
      redirect_to admin_youth_index_path
    else
      flash.now[:warning] = 'You can not create youth, please check error'
      render :new
    end
  end

  def update
    if @youth.update(params_youth)
      flash[:notice] = 'You updated youth successfully'
      redirect_to admin_youth_index_path
    else
      flash.now[:warning] = 'You can not update youth, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Youth.find_by(is_main_article: true)
  end

  def destroy
    @youth.destroy
    flash[:notice] = 'You deleted youth successfully'
    redirect_to admin_youth_index_path
  end

  private
  def params_youth
    params.require(:youth).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_youth
    @youth = Youth.find_by(id: params[:id])
  end
end
