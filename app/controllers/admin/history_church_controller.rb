class Admin::HistoryChurchController < Admin::AdminController
  before_action :set_history_church, only: [:destroy, :edit, :update, :show]

  def index
    @history_churchs = HistoryChurch.all
  end

  def new
    @is_main_article = HistoryChurch.find_by(is_main_article: true)
    @history_church = HistoryChurch.new
  end

  def show
    @is_main_article = @history_church.is_main_article
  end

  def create
    history_church = current_user.history_churchs.new(params_history_church)
    if history_church.save
      flash[:notice] = 'You created history_church successfully'
      redirect_to admin_history_church_index_path
    else
      flash.now[:warning] = 'You can not create history_church, please check error'
      render :new
    end
  end

  def update
    if @history_church.update(params_history_church)
      flash[:notice] = 'You updated history_church successfully'
      redirect_to admin_history_church_index_path
    else
      flash.now[:warning] = 'You can not update history_church, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = HistoryChurch.find_by(is_main_article: true)
  end

  def destroy
    @history_church.destroy
    flash[:notice] = 'You deleted history_church successfully'
    redirect_to admin_history_church_index_path
  end

  private
  def params_history_church
    params.require(:history_church).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_history_church
    @history_church = HistoryChurch.find_by(id: params[:id])
  end
end
