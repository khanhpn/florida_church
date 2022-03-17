class Admin::MusicMinistryController < Admin::AdminController
  before_action :set_music_ministry, only: [:destroy, :edit, :update, :show]

  def index
    @music_ministries = MusicMinistry.all
  end

  def new
    @is_main_article = MusicMinistry.find_by(is_main_article: true)
    @music_ministry = MusicMinistry.new
  end

  def show
    @is_main_article = @music_ministry.is_main_article
  end

  def create
    music_ministry = current_user.music_ministries.new(params_music_ministry)
    if music_ministry.save
      flash[:notice] = 'You created music ministry successfully'
      redirect_to admin_music_ministry_index_path
    else
      flash.now[:warning] = 'You can not create music ministry, please check error'
      render :new
    end
  end

  def update
    if @music_ministry.update(params_music_ministry)
      flash[:notice] = 'You updated music ministry successfully'
      redirect_to admin_music_ministry_index_path
    else
      flash.now[:warning] = 'You can not update music ministry, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = @music_ministry.is_main_article
  end

  def destroy
    @music_ministry.destroy
    flash[:notice] = 'You deleted music ministry successfully'
    redirect_to admin_music_ministry_index_path
  end

  private
  def params_music_ministry
    params.require(:music_ministry).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_music_ministry
    @music_ministry = MusicMinistry.find_by(id: params[:id])
  end
end
