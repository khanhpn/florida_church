class Admin::WelcomeController < Admin::AdminController
  before_action :set_welcome, only: [:destroy, :edit, :update, :show]

  def index
    @welcomes = Welcome.all
  end

  def new
    @is_main_article = Welcome.find_by(is_main_article: true)
    @welcome = Welcome.new
  end

  def show
    @is_main_article = @welcome.is_main_article
  end

  def create
    welcome = Welcome.new(params_welcome)
    if welcome.save
      flash[:notice] = 'You created welcome successfully'
      redirect_to admin_welcome_index_path
    else
      flash.now[:warning] = 'You can not create welcome, please check error'
      render :new
    end
  end

  def update
    if @welcome.update(params_welcome)
      flash[:notice] = 'You updated welcome successfully'
      redirect_to admin_welcome_index_path
    else
      flash.now[:warning] = 'You can not update welcome, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Welcome.find_by(is_main_article: true)
  end

  def destroy
    @welcome.destroy
    flash[:notice] = 'You deleted welcome successfully'
    redirect_to admin_welcome_index_path
  end

  private
  def params_welcome
    params.require(:welcome).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_welcome
    @welcome = Welcome.find_by(id: params[:id])
  end
end
