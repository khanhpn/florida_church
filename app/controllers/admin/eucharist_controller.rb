class Admin::EucharistController < Admin::AdminController
  before_action :set_eucharist, only: [:destroy, :edit, :update, :show]

  def index
    @eucharists = Eucharist.all
  end

  def new
    @is_main_article = Eucharist.find_by(is_main_article: true)
    @eucharist = Eucharist.new
  end

  def show
    @is_main_article = @eucharist.is_main_article
  end

  def create
    eucharist = current_user.eucharists.new(params_eucharist)
    if eucharist.save
      flash[:notice] = 'You created eucharist successfully'
      redirect_to admin_eucharist_index_path
    else
      flash.now[:warning] = 'You can not create eucharist, please check error'
      render :new
    end
  end

  def update
    if @eucharist.update(params_eucharist)
      flash[:notice] = 'You updated eucharist successfully'
      redirect_to admin_eucharist_index_path
    else
      flash.now[:warning] = 'You can not update eucharist, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Eucharist.find_by(is_main_article: true)
  end

  def destroy
    @eucharist.destroy
    flash[:notice] = 'You deleted eucharist successfully'
    redirect_to admin_eucharist_index_path
  end

  private
  def params_eucharist
    params.require(:eucharist).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_eucharist
    @eucharist = Eucharist.find_by(id: params[:id])
  end
end
