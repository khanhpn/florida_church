class Admin::AdultController < Admin::AdminController
  before_action :set_adult, only: [:destroy, :edit, :update, :show]

  def index
    @adults = Adult.all
  end

  def new
    @is_main_article = Adult.find_by(is_main_article: true)
    @adult = Adult.new
  end

  def show
    @is_main_article = @adult.is_main_article
  end

  def create
    adult = current_user.adults.new(params_adult)
    if adult.save
      flash[:notice] = 'You created adult successfully'
      redirect_to admin_adult_index_path
    else
      flash.now[:warning] = 'You can not create adult, please check error'
      render :new
    end
  end

  def update
    if @adult.update(params_adult)
      flash[:notice] = 'You updated adult successfully'
      redirect_to admin_adult_index_path
    else
      flash.now[:warning] = 'You can not update adult, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Adult.find_by(is_main_article: true)
  end

  def destroy
    @adult.destroy
    flash[:notice] = 'You deleted adult successfully'
    redirect_to admin_adult_index_path
  end

  private
  def params_adult
    params.require(:adult).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_adult
    @adult = Adult.find_by(id: params[:id])
  end
end
