class Admin::ConfirmationController < Admin::AdminController
  before_action :set_confirmation, only: [:destroy, :edit, :update, :show]

  def index
    @confirmations = Confirmation.all
  end

  def new
    @is_main_article = Confirmation.find_by(is_main_article: true)
    @confirmation = Confirmation.new
  end

  def show
    @is_main_article = @confirmation.is_main_article
  end

  def create
    confirmation = current_user.confirmations.new(params_confirmation)
    if confirmation.save
      flash[:notice] = 'You created confirmation successfully'
      redirect_to admin_confirmation_index_path
    else
      flash.now[:warning] = 'You can not create confirmation, please check error'
      render :new
    end
  end

  def update
    if @confirmation.update(params_confirmation)
      flash[:notice] = 'You updated confirmation successfully'
      redirect_to admin_confirmation_index_path
    else
      flash.now[:warning] = 'You can not update confirmation, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Confirmation.find_by(is_main_article: true)
  end

  def destroy
    @confirmation.destroy
    flash[:notice] = 'You deleted confirmation successfully'
    redirect_to admin_confirmation_index_path
  end

  private
  def params_confirmation
    params.require(:confirmation).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_confirmation
    @confirmation = Confirmation.find_by(id: params[:id])
  end
end
