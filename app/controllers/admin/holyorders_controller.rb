class Admin::HolyordersController < Admin::AdminController
  before_action :set_holyorder, only: [:destroy, :edit, :update]

  def index
    @holyorders = Holyorder.all
  end

  def new
    @holyorder = Holyorder.new
  end

  def create
    holyorder = current_user.holyorders.new(params_holyorder)
    if holyorder.save
      flash[:notice] = 'You created holyorder successfully'
      redirect_to admin_holyorder_index_path
    else
      flash.now[:warning] = 'You can not create holyorder, please check error'
      render :new
    end
  end

  def update
    if @holyorder.update(params_holyorder)
      flash[:notice] = 'You updated holyorder successfully'
      redirect_to admin_holyorder_index_path
    else
      flash.now[:warning] = 'You can not update holyorder, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @holyorder.destroy
    flash[:notice] = 'You deleted holyorder successfully'
    redirect_to admin_holyorder_index_path
  end

  private
  def params_holyorder
    params.require(:holyorder).permit(:name, :content, :display_order, :display)
  end

  def set_holyorder
    @holyorder = Holyorder.find_by(id: params[:id])
  end
end
