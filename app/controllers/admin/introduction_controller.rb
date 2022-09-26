class Admin::IntroductionController < Admin::AdminController
  before_action :set_introduction, only: [:destroy, :edit, :update]

  def index
    @introduction = Introduction.first
  end

  def new
    @introduction = Introduction.new
  end

  def create
    introduction = Introduction.new(params_introduction)
    introduction.user_id = current_user.id

    if introduction.save
      flash[:notice] = 'You created introduction successfully'
      redirect_to admin_introduction_index_path
    else
      flash.now[:warning] = 'You can not create introduction, please check error'
      render :new
    end
  end

  def update
    if @introduction.update(params_introduction)
      flash[:notice] = 'You updated introduction successfully'
      redirect_to admin_introduction_index_path
    else
      flash.now[:warning] = 'You can not update introduction, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @introduction.destroy
    flash[:notice] = 'You deleted introduction successfully'
    redirect_to admin_introduction_index_path
  end

  private
  def params_introduction
    params.require(:introduction).permit(
      :name, :content, :youtube_url, :flict_channel, :youtube_channel_url, :facebook_channel,
      :address, :phone, :email, :copywrite, :office_hour, :logo_icon, :header_logo_icon
    )
  end

  def set_introduction
    @introduction = Introduction.find_by(id: params[:id])
  end
end
