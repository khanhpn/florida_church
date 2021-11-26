class Admin::SacramentalController < Admin::AdminController
  before_action :set_sacramental, only: [:destroy, :edit, :update]

  def index
    @sacramentals = Sacramental.all
  end

  def new
    @sacramental = Sacramental.new
  end

  def create
    sacramental = current_user.sacramentals.new(params_sacramental)
    if sacramental.save
      flash[:notice] = 'You created sacramental successfully'
      redirect_to admin_sacramental_index_path
    else
      flash.now[:warning] = 'You can not create sacramental, please check error'
      render :new
    end
  end

  def update
    if @sacramental.update(params_sacramental)
      flash[:notice] = 'You updated sacramental successfully'
      redirect_to admin_sacramental_index_path
    else
      flash.now[:warning] = 'You can not update sacramental, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @sacramental.destroy
    flash[:notice] = 'You deleted sacramental successfully'
    redirect_to admin_sacramental_index_path
  end

  private
  def params_sacramental
    params.require(:sacramental).permit(:name, :content, :display_order, :display)
  end

  def set_sacramental
    @sacramental = Sacramental.find_by(id: params[:id])
  end
end
