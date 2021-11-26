class Admin::BulletinController < Admin::AdminController
  before_action :set_bulletin, only: [:destroy, :edit, :update]

  def index
    @bulletins = Bulletin.all
  end

  def new
    @bulletin = Bulletin.new
  end

  def create
    bulletin = current_user.bulletins.new(params_bulletin)
    if bulletin.save
      flash[:notice] = 'You created bulletin successfully'
      redirect_to admin_bulletin_index_path
    else
      flash.now[:warning] = 'You can not create bulletin, please check error'
      render :new
    end
  end

  def update
    if @bulletin.update(params_bulletin)
      flash[:notice] = 'You updated bulletin successfully'
      redirect_to admin_bulletin_index_path
    else
      flash.now[:warning] = 'You can not update bulletin, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @bulletin.destroy
    flash[:notice] = 'You deleted bulletin successfully'
    redirect_to admin_bulletin_index_path
  end

  private
  def params_bulletin
    params.require(:bulletin).permit(:name, :content, :display, :image_content)
  end

  def set_bulletin
    @bulletin = Bulletin.find_by(id: params[:id])
  end
end
