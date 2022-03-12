class Admin::AltarServerController < Admin::AdminController
  before_action :set_altar_server, only: [:destroy, :edit, :update, :show, :new_children, :children, :detail_children, :update_children, :delete_children]

  def index
    @altar_servers = AltarServer.all
  end

  def new
    @is_main_article = AltarServer.find_by(is_main_article: true)
    @altar_server = AltarServer.new
  end

  def show
    @worships = @altar_server.worships
  end

  def new_children
    @worship = Worship.new
  end

  def detail_children
    @detail_children = @altar_server.worships.find_by(id: params[:children_id])
  end

  def update_children
    @detail_children = @altar_server.worships.find_by(id: params[:children_id])
    if @detail_children.update(params_altar_server_children)
      flash[:notice] = 'You updated altar server successfully'
      redirect_to admin_altar_server_path(params[:id])
    else
      flash.now[:warning] = 'You can not update altar server, please check error'
      render :detail_children
    end
  end

  def delete_children
    detail_children = @altar_server.worships.find_by(id: params[:children_id])
    detail_children.destroy
    flash[:notice] = 'You deleted altar children successfully'
    redirect_to admin_altar_server_path(params[:id])
  end

  def children
    worship = @altar_server.worships.new(params_altar_server_children)
    if worship.save!
      redirect_to admin_altar_server_path(@altar_server)
    else
      render :new_children
    end
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

  def params_altar_server_children
    params.require(:worship).permit(:title, :worship_upload, :file_image, :file_pdf)
  end

  def set_altar_server
    @altar_server = AltarServer.find_by(id: params[:id])
  end
end
