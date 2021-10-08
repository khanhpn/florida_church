class Admin::LogoLinkController < Admin::AdminController
  before_action :set_logo_link, only: [:destroy, :edit, :update]

  def index
    @linked_logos = LinkedLogo.all
  end

  def new
    @linked_logo = LinkedLogo.new
  end

  def create
    logo_link = current_user.linked_logos.new(params_logo_link)
    if logo_link.save
      flash[:notice] = 'You created logo_link successfully'
      redirect_to admin_logo_link_index_path
    else
      flash.now[:warning] = 'You can not create logo_link, please check error'
      render :new
    end
  end

  def update
    if @linked_logo.update(params_logo_link)
      flash[:notice] = 'You updated logo_link successfully'
      redirect_to admin_logo_link_index_path
    else
      flash.now[:warning] = 'You can not update logo_link, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @linked_logo.destroy
    flash[:notice] = 'You deleted logo_link successfully'
    redirect_to admin_logo_link_index_path
  end

  private
  def params_logo_link
    params.require(:linked_logo).permit(:name, :display, :logo_linked)
  end

  def set_logo_link
    @linked_logo = LinkedLogo.find_by(id: params[:id])
  end
end
