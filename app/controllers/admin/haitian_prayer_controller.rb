class Admin::HaitianPrayerController < Admin::AdminController
  before_action :set_haitian_prayer, only: [:destroy, :edit, :update, :show]

  def index
    @haitian_prayers = HaitianPrayer.all
  end

  def new
    @is_main_article = HaitianPrayer.find_by(is_main_article: true)
    @haitian_prayer = HaitianPrayer.new
  end

  def show
    @is_main_article = @haitian_prayer.is_main_article
  end

  def create
    haitian_prayer = current_user.haitian_prayers.new(params_haitian_prayer)
    if haitian_prayer.save
      flash[:notice] = 'You created haitian prayer successfully'
      redirect_to admin_haitian_prayer_index_path
    else
      flash.now[:warning] = 'You can not create haitian prayer, please check error'
      render :new
    end
  end

  def update
    if @haitian_prayer.update(params_haitian_prayer)
      flash[:notice] = 'You updated haitian prayer successfully'
      redirect_to admin_haitian_prayer_index_path
    else
      flash.now[:warning] = 'You can not update haitian prayer, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = HaitianPrayer.find_by(is_main_article: true)
  end

  def destroy
    @haitian_prayer.destroy
    flash[:notice] = 'You deleted haitian prayer successfully'
    redirect_to admin_haitian_prayer_index_path
  end

  private
  def params_haitian_prayer
    params.require(:haitian_prayer).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_haitian_prayer
    @haitian_prayer = HaitianPrayer.find_by(id: params[:id])
  end
end
