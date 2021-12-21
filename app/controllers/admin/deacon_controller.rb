class Admin::DeaconController < Admin::AdminController
  before_action :set_deacon, only: [:destroy, :edit, :update]

  def index
    @deacons = Deacon.all
  end

  def new
    @deacon = Deacon.new
  end

  def create
    deacon = current_user.deacons.new(params_deacon)
    if deacon.save
      flash[:notice] = 'You created deacon successfully'
      redirect_to admin_deacon_index_path
    else
      flash.now[:warning] = 'You can not create deacon, please check error'
      render :new
    end
  end

  def update
    if @deacon.update(params_deacon)
      flash[:notice] = 'You updated deacon successfully'
      redirect_to admin_deacon_index_path
    else
      flash.now[:warning] = 'You can not update deacon, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @deacon.destroy
    flash[:notice] = 'You deleted deacon successfully'
    redirect_to admin_deacon_index_path
  end

  private
  def params_deacon
    params.require(:deacon).permit(:name, :content, :display_order, :display)
  end

  def set_deacon
    @deacon = Deacon.find_by(id: params[:id])
  end
end
