class Admin::RespectLifeController < Admin::AdminController
  before_action :set_respect_life, only: [:destroy, :edit, :update, :show]

  def index
    @respect_lifes = RespectLife.all
  end

  def new
    @is_main_article = RespectLife.find_by(is_main_article: true)
    @respect_life = RespectLife.new
  end

  def show
    @is_main_article = @respect_life.is_main_article
  end

  def create
    respect_life = current_user.respect_lifes.new(params_respect_life)
    if respect_life.save
      flash[:notice] = 'You created respect live successfully'
      redirect_to admin_respect_life_index_path
    else
      flash.now[:warning] = 'You can not create respect live, please check error'
      render :new
    end
  end

  def update
    if @respect_life.update(params_respect_life)
      flash[:notice] = 'You updated respect live successfully'
      redirect_to admin_respect_life_index_path
    else
      flash.now[:warning] = 'You can not update respect live, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = RespectLife.find_by(is_main_article: true)
  end

  def destroy
    @respect_life.destroy
    flash[:notice] = 'You deleted respect live successfully'
    redirect_to admin_respect_life_index_path
  end

  private
  def params_respect_life
    params.require(:respect_life).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_respect_life
    @respect_life = RespectLife.find_by(id: params[:id])
  end
end
