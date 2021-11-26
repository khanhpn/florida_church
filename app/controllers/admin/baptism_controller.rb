class Admin::BaptismController < Admin::AdminController
  before_action :set_baptism, only: [:destroy, :edit, :update]

  def index
    @baptisms = Baptism.all
  end

  def new
    @baptism = Baptism.new
  end

  def create
    baptism = current_user.baptisms.new(params_baptism)
    if baptism.save
      flash[:notice] = 'You created baptism successfully'
      redirect_to admin_baptism_index_path
    else
      flash.now[:warning] = 'You can not create baptism, please check error'
      render :new
    end
  end

  def update
    if @baptism.update(params_baptism)
      flash[:notice] = 'You updated baptism successfully'
      redirect_to admin_baptism_index_path
    else
      flash.now[:warning] = 'You can not update baptism, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @baptism.destroy
    flash[:notice] = 'You deleted baptism successfully'
    redirect_to admin_baptism_index_path
  end

  private
  def params_baptism
    params.require(:baptism).permit(:name, :content, :display_order, :display)
  end

  def set_baptism
    @baptism = Baptism.find_by(id: params[:id])
  end
end
