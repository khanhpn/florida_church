class Admin::RespectLiveController < Admin::AdminController
  before_action :set_respect_live, only: [:destroy, :edit, :update, :show]

  def index
    @respect_lives = RespectLive.all
  end

  def new
    @is_main_article = RespectLive.find_by(is_main_article: true)
    @respect_live = RespectLive.new
  end

  def show
    @is_main_article = @respect_live.is_main_article
  end

  def create
    respect_live = current_user.respect_lives.new(params_respect_live)
    if respect_live.save
      flash[:notice] = 'You created respect live successfully'
      redirect_to admin_respect_live_index_path
    else
      flash.now[:warning] = 'You can not create respect live, please check error'
      render :new
    end
  end

  def update
    if @respect_live.update(params_respect_live)
      flash[:notice] = 'You updated respect live successfully'
      redirect_to admin_respect_live_index_path
    else
      flash.now[:warning] = 'You can not update respect live, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = RespectLive.find_by(is_main_article: true)
  end

  def destroy
    @respect_live.destroy
    flash[:notice] = 'You deleted respect live successfully'
    redirect_to admin_respect_live_index_path
  end

  private
  def params_respect_live
    params.require(:prayer_group).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_respect_live
    @respect_live = RespectLive.find_by(id: params[:id])
  end
end
