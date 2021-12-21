class Admin::ClergyController < Admin::AdminController
  before_action :set_clergy, only: [:destroy, :edit, :update]

  def index
    @clergies = Clergy.all
  end

  def new
    @clergy = Clergy.new
  end

  def create
    clergy = current_user.clergies.new(params_clergy)
    if clergy.save
      flash[:notice] = 'You created clergy successfully'
      redirect_to admin_clergy_index_path
    else
      flash.now[:warning] = 'You can not create clergy, please check error'
      render :new
    end
  end

  def update
    if @clergy.update(params_clergy)
      flash[:notice] = 'You updated clergy successfully'
      redirect_to admin_clergy_index_path
    else
      flash.now[:warning] = 'You can not update clergy, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @clergy.destroy
    flash[:notice] = 'You deleted clergy successfully'
    redirect_to admin_clergy_index_path
  end

  private
  def params_clergy
    params.require(:clergy).permit(:name, :content, :display_order, :display)
  end

  def set_clergy
    @clergy = Clergy.find_by(id: params[:id])
  end
end
