class Admin::HolyordersController < Admin::AdminController
  before_action :set_holyorder, only: [:destroy, :edit, :update, :show]

  def index
    @holyorders = Holyorder.all
  end

  def new
    @is_main_article = Holyorder.find_by(is_main_article: true)
    @holyorder = Holyorder.new
  end

  def show
    @is_main_article = @holyorder.is_main_article
  end

  def create
    holyorder = current_user.holyorders.new(params_holyorder)
    if holyorder.save
      flash[:notice] = 'You created holyorder successfully'
      redirect_to admin_holyorder_index_path
    else
      flash.now[:warning] = 'You can not create holyorder, please check error'
      render :new
    end
  end

  def update
    if @holyorder.update(params_holyorder)
      flash[:notice] = 'You updated holyorder successfully'
      redirect_to admin_holyorder_index_path
    else
      flash.now[:warning] = 'You can not update holyorder, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Holyorder.find_by(is_main_article: true)
  end

  def destroy
    @holyorder.destroy
    flash[:notice] = 'You deleted holyorder successfully'
    redirect_to admin_holyorder_index_path
  end

  private
  def params_holyorder
    params.require(:holyorder).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_holyorder
    @holyorder = Holyorder.find_by(id: params[:id])
  end
end
