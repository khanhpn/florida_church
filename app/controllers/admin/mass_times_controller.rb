class Admin::MassTimesController < Admin::AdminController
  before_action :set_mass_time, only: [:destroy, :edit, :update]

  def index
    @mass_time = MassTime.last
  end

  def new
    @mass_time = MassTime.new
  end

  def create
    mass_time = current_user.mass_times.new(params_mass)
    if mass_time.save
      flash[:notice] = 'You created mass successfully'
      redirect_to admin_mass_times_path
    else
      flash.now[:warning] = 'You can not create mass, please check error'
      render :new
    end
  end

  def update
    if @mass_time.update(params_mass)
      flash[:notice] = 'You updated mass successfully'
      redirect_to admin_mass_times_path
    else
      flash.now[:warning] = 'You can not update mass time, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @mass_time.destroy
    flash[:notice] = 'You deleted mass time successfully'
    redirect_to admin_mass_times_path
  end

  private
  def params_mass
    params.require(:mass_time).permit(:name, :content)
  end

  def set_mass_time
    @mass_time = MassTime.find_by(id: params[:id])
  end
end
