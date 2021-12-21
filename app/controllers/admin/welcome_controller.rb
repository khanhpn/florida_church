class Admin::WelcomeController < Admin::AdminController
  before_action :set_welcome, only: [:destroy, :edit, :update]

  def index
    @welcome = Welcome.last
  end

  def new
    @welcome = Welcome.new
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
  end

  def destroy
    @welcome.destroy
    flash[:notice] = 'You deleted welcome successfully'
    redirect_to admin_welcome_index_path
  end

  private
  def params_welcome
    params.require(:welcome).permit(:name, :content)
  end

  def set_welcome
    @welcome = Welcome.find_by(id: params[:id])
  end
end
