class Admin::EucharisticSaintVideoController < Admin::AdminController
  before_action :set_eucharistic_saint_video, only: [:destroy, :edit, :update, :show]

  def index
    @eucharistic_saint_videos = EucharisticSaintVideo.all
  end

  def new
    @is_main_article = EucharisticSaintVideo.find_by(is_main_article: true)
    @eucharistic_saint_video = EucharisticSaintVideo.new
  end

  def show
    @is_main_article = @eucharistic_saint_video.is_main_article
  end

  def create
    eucharistic_saint_video = current_user.eucharistic_saint_videos.new(params_eucharistic_saint_video)
    if eucharistic_saint_video.save
      flash[:notice] = 'You created eucharistic saint videos successfully'
      redirect_to admin_eucharistic_saint_video_index_path
    else
      flash.now[:warning] = 'You can not create eucharistic saint videos, please check error'
      render :new
    end
  end

  def update
    if @eucharistic_saint_video.update(params_eucharistic_saint_video)
      flash[:notice] = 'You updated children youth successfully'
      redirect_to admin_eucharistic_saint_video_index_path
    else
      flash.now[:warning] = 'You can not update children youth, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = EucharisticSaintVideo.find_by(is_main_article: true)
  end

  def destroy
    @eucharistic_saint_video.destroy
    flash[:notice] = 'You deleted children youth successfully'
    redirect_to admin_eucharistic_saint_video_index_path
  end

  private
  def params_eucharistic_saint_video
    params.require(:eucharistic_saint_video).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_eucharistic_saint_video
    @eucharistic_saint_video = EucharisticSaintVideo.find_by(id: params[:id])
  end
end
