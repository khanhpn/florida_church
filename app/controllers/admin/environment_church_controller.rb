class Admin::EnvironmentChurchController < Admin::AdminController
  before_action :set_environment_church, only: [:destroy, :edit, :update]

  def index
    @environment_churchs = EnvironmentChurch.all
  end

  def new
    @environment_church = EnvironmentChurch.new
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
  end

  def destroy
    @environment_church.destroy
    flash[:notice] = 'You deleted environment_church successfully'
    redirect_to admin_environment_church_index_path
  end

  private
  def params_environment_church
    params.require(:environment_church).permit(:name, :content, :display_order, :display)
  end

  def set_environment_church
    @environment_church = EnvironmentChurch.find_by(id: params[:id])
  end
end
