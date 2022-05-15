class Admin::EnvironmentChurchController < Admin::AdminController
  before_action :set_environment_church, only: [:destroy, :edit, :update, :show]

  def index
    @environment_churchs = EnvironmentChurch.all
  end

  def new
    @is_main_article = EnvironmentChurch.find_by(is_main_article: true)
    @environment_church = EnvironmentChurch.new
  end

  def show
    @is_main_article = @environment_church.is_main_article
  end

  def create
    environment_church = current_user.environment_churchs.new(params_environment_church)
    if environment_church.save
      flash[:notice] = 'You created environment_church successfully'
      redirect_to admin_environment_church_index_path
    else
      flash.now[:warning] = 'You can not create environment_church, please check error'
      render :new
    end
  end

  def update
    if @environment_church.update(params_environment_church)
      flash[:notice] = 'You updated environment_church successfully'
      redirect_to admin_environment_church_index_path
    else
      flash.now[:warning] = 'You can not update environment_church, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = EnvironmentChurch.find_by(is_main_article: true)
  end

  def destroy
    @environment_church.destroy
    flash[:notice] = 'You deleted environment_church successfully'
    redirect_to admin_environment_church_index_path
  end

  private
  def params_environment_church
    params.require(:environment_church).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_environment_church
    @environment_church = EnvironmentChurch.find_by(id: params[:id])
  end
end
