class Admin::DeaconController < Admin::AdminController
  before_action :set_daecon, only: [:destroy, :edit, :update]

  def index
    @daecons = Daecon.all
  end

  def new
    @daecon = Daecon.new
  end

  def create
    daecon = current_user.daecons.new(params_daecon)
    if daecon.save
      flash[:notice] = 'You created daecon successfully'
      redirect_to admin_daecon_index_path
    else
      flash.now[:warning] = 'You can not create daecon, please check error'
      render :new
    end
  end

  def update
    if @daecon.update(params_daecon)
      flash[:notice] = 'You updated daecon successfully'
      redirect_to admin_daecon_index_path
    else
      flash.now[:warning] = 'You can not update daecon, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @daecon.destroy
    flash[:notice] = 'You deleted daecon successfully'
    redirect_to admin_daecon_index_path
  end

  private
  def params_daecon
    params.require(:daecon).permit(:name, :content, :display_order, :display)
  end

  def set_daecon
    @daecon = Daecon.find_by(id: params[:id])
  end
end
