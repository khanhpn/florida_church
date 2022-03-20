class Admin::PrayGardenController < Admin::AdminController
  before_action :set_pray_garden, only: [:destroy, :edit, :update, :show]

  def index
    @pray_gardens = PrayGarden.all
  end

  def new
    @is_main_article = PrayGarden.find_by(is_main_article: true)
    @pray_garden = PrayGarden.new
  end

  def show
    @is_main_article = @pray_garden.is_main_article
  end

  def create
    pray_garden = current_user.pray_gardens.new(params_pray_garden)
    if pray_garden.save
      flash[:notice] = 'You created pray_garden successfully'
      redirect_to admin_pray_garden_index_path
    else
      flash.now[:warning] = 'You can not create pray_garden, please check error'
      render :new
    end
  end

  def update
    if @pray_garden.update(params_pray_garden)
      flash[:notice] = 'You updated pray_garden successfully'
      redirect_to admin_pray_garden_index_path
    else
      flash.now[:warning] = 'You can not update pray_garden, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = PrayGarden.find_by(is_main_article: true)
  end

  def destroy
    @pray_garden.destroy
    flash[:notice] = 'You deleted pray_garden successfully'
    redirect_to admin_pray_garden_index_path
  end

  private
  def params_pray_garden
    params.require(:pray_garden).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_pray_garden
    @pray_garden = PrayGarden.find_by(id: params[:id])
  end
end
