class Admin::AdorationTimesController < Admin::AdminController
  before_action :set_adoration_time, only: [:destroy, :edit, :update]

  def index
    @adoration_time = AdorationTime.last
  end

  def new
    @adoration_time = AdorationTime.new
  end

  def create
    adoration_time = current_user.adoration_times.new(params_adoration_time)
    if adoration_time.save
      flash[:notice] = 'You created adoration time successfully'
      redirect_to admin_adoration_times_path
    else
      flash.now[:warning] = 'You can not create adoration time, please check error'
      render :new
    end
  end

  def update
    if @adoration_time.update(params_adoration_time)
      flash[:notice] = 'You updated adoration time successfully'
      redirect_to admin_adoration_times_path
    else
      flash.now[:warning] = 'You can not update adoration time, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @adoration_time.destroy
    flash[:notice] = 'You deleted adoration time successfully'
    redirect_to admin_adoration_times_path
  end

  private
  def params_adoration_time
    params.require(:adoration_time).permit(:name, :content)
  end

  def set_adoration_time
    @adoration_time = AdorationTime.find_by(id: params[:id])
  end
end
