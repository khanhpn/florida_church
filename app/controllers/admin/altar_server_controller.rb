class Admin::AltarServerController < Admin::AdminController
  before_action :set_altar_server, only: [:destroy, :edit, :update]

  def index
    @altar_serveres = AltarServer.all
  end

  def new
    @altar_server = AltarServer.new
  end

  def create
    altar_server = current_user.altar_serveres.new(params_altar_server)
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
  end

  def destroy
    @altar_server.destroy
    flash[:notice] = 'You deleted altar server successfully'
    redirect_to admin_altar_server_index_path
  end

  private
  def params_altar_server
    params.require(:altar_server).permit(:name, :content, :display_order, :display)
  end

  def set_altar_server
    @altar_server = AltarServer.find_by(id: params[:id])
  end
end
