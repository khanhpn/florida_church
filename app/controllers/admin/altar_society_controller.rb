class Admin::AltarSocietyController < Admin::AdminController
  before_action :set_altar_society, only: [:destroy, :edit, :update, :show]

  def index
    @altar_societies = AltarSociety.all
  end

  def new
    @is_main_article = AltarSociety.find_by(is_main_article: true)
    @altar_society = AltarSociety.new
  end

  def show
    @is_main_article = @altar_society.is_main_article
  end

  def create
    altar_society = current_user.altar_societies.new(params_altar_society)
    if altar_society.save
      flash[:notice] = 'You created altar society successfully'
      redirect_to admin_altar_society_index_path
    else
      flash.now[:warning] = 'You can not create altar society, please check error'
      render :new
    end
  end

  def update
    if @altar_society.update(params_altar_society)
      flash[:notice] = 'You updated altar society successfully'
      redirect_to admin_altar_society_index_path
    else
      flash.now[:warning] = 'You can not update altar society, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = AltarSociety.find_by(is_main_article: true)
  end

  def destroy
    @altar_society.destroy
    flash[:notice] = 'You deleted altar society successfully'
    redirect_to admin_altar_society_index_path
  end

  private
  def params_altar_society
    params.require(:altar_society).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_altar_society
    @altar_society = AltarSociety.find_by(id: params[:id])
  end
end
