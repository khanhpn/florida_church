class Admin::AltarServerController < Admin::AdminController
  before_action :set_altar_server, only: [:destroy, :edit, :update, :show]

  def index
    @altar_servers = AltarServer.all
  end

  def new
    @is_main_article = AltarServer.find_by(is_main_article: true)
    @altar_server = AltarServer.new
  end

  def show
    @is_main_article = @altar_server.is_main_article
  end

  def create
    altar_server = AltarServer.new(params_altar_server)
    altar_server.user_id = current_user.id
    if altar_server.save
      flash[:notice] = 'You created altar server successfully'
      redirect_to admin_altar_server_index_path
    else
      flash.now[:warning] = 'You can not create altar server, please check error'
      render :new
    end
  end

  def update
    if @altar_server.update(params_altar_server)
      flash[:notice] = 'You updated altar server successfully'
      redirect_to admin_altar_server_index_path
    else
      flash.now[:warning] = 'You can not update altar server, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = AltarServer.find_by(is_main_article: true)
  end

  def destroy
    @altar_server.destroy
    flash[:notice] = 'You deleted altar server successfully'
    redirect_to admin_altar_server_index_path
  end

  private
  def params_altar_server
    params.require(:altar_server).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_altar_server
    @altar_server = AltarServer.find_by(id: params[:id])
  end
end
