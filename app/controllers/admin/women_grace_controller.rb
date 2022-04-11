class Admin::WomenGraceController < Admin::AdminController
  before_action :set_women_grace, only: [:destroy, :edit, :update, :show]

  def index
    @women_graces = WomenGrace.all
  end

  def new
    @is_main_article = WomenGrace.find_by(is_main_article: true)
    @women_grace = WomenGrace.new
  end

  def show
    @is_main_article = @women_grace.is_main_article
  end

  def create
    women_grace = current_user.women_graces.new(params_women_grace)
    if women_grace.save
      flash[:notice] = 'You created women grace successfully'
      redirect_to admin_women_grace_index_path
    else
      flash.now[:warning] = 'You can not create women grace, please check error'
      render :new
    end
  end

  def update
    if @women_grace.update(params_women_grace)
      flash[:notice] = 'You updated women_grace successfully'
      redirect_to admin_women_grace_index_path
    else
      flash.now[:warning] = 'You can not update women grace, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = WomenGrace.find_by(is_main_article: true)
  end

  def destroy
    @women_grace.destroy
    flash[:notice] = 'You deleted women grace successfully'
    redirect_to admin_women_grace_index_path
  end

  private
  def params_women_grace
    params.require(:women_grace).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_women_grace
    @women_grace = WomenGrace.find_by(id: params[:id])
  end
end
