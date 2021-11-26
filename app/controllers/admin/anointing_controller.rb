class Admin::AnointingController < Admin::AdminController
  before_action :set_anointing, only: [:destroy, :edit, :update]

  def index
    @anointings = AnointingThesick.all
  end

  def new
    @anointing = AnointingThesick.new
  end

  def create
    anointing = current_user.anointing_thesicks.new(params_anointing)
    if anointing.save
      flash[:notice] = 'You created anointing successfully'
      redirect_to admin_anointing_index_path
    else
      flash.now[:warning] = 'You can not create anointing, please check error'
      render :new
    end
  end

  def update
    if @anointing.update(params_anointing)
      flash[:notice] = 'You updated anointing successfully'
      redirect_to admin_anointing_index_path
    else
      flash.now[:warning] = 'You can not update anointing, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @anointing.destroy
    flash[:notice] = 'You deleted anointing successfully'
    redirect_to admin_anointing_index_path
  end

  private
  def params_anointing
    params.require(:anointing_thesick).permit(:name, :content, :display_order, :display)
  end

  def set_anointing
    @anointing = AnointingThesick.find_by(id: params[:id])
  end
end
