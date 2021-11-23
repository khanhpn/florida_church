class Admin::FuneralController < Admin::AdminController
  before_action :set_funeral, only: [:destroy, :edit, :update]

  def index
    @funerals = Funeral.all
  end

  def new
    @funeral = Funeral.new
  end

  def create
    funeral = current_user.funerals.new(params_funeral)
    if funeral.save
      flash[:notice] = 'You created funeral successfully'
      redirect_to admin_funeral_index_path
    else
      flash.now[:warning] = 'You can not create funeral, please check error'
      render :new
    end
  end

  def update
    if @funeral.update(params_funeral)
      flash[:notice] = 'You updated funeral successfully'
      redirect_to admin_funeral_index_path
    else
      flash.now[:warning] = 'You can not update funeral, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @funeral.destroy
    flash[:notice] = 'You deleted funeral successfully'
    redirect_to admin_funeral_index_path
  end

  private
  def params_funeral
    params.require(:funeral).permit(:name, :content, :display_order, :display)
  end

  def set_funeral
    @funeral = Funeral.find_by(id: params[:id])
  end
end
