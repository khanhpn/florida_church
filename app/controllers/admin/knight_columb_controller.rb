class Admin::KnightColumbController < Admin::AdminController
  before_action :set_knight_columb, only: [:destroy, :edit, :update, :show]

  def index
    @knight_columbs = KnightColumb.all
  end

  def new
    @is_main_article = KnightColumb.find_by(is_main_article: true)
    @knight_columb = KnightColumb.new
  end

  def show
    @is_main_article = @knight_columb.is_main_article
  end

  def create
    knight_columb = current_user.knight_columbs.new(params_knight_columb)
    if knight_columb.save
      flash[:notice] = 'You created knight columbs successfully'
      redirect_to admin_knight_columb_index_path
    else
      flash.now[:warning] = 'You can not create knight columbs, please check error'
      render :new
    end
  end

  def update
    if @knight_columb.update(params_knight_columb)
      flash[:notice] = 'You updated children youth successfully'
      redirect_to admin_knight_columb_index_path
    else
      flash.now[:warning] = 'You can not update children youth, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = KnightColumb.find_by(is_main_article: true)
  end

  def destroy
    @knight_columb.destroy
    flash[:notice] = 'You deleted children youth successfully'
    redirect_to admin_knight_columb_index_path
  end

  private
  def params_knight_columb
    params.require(:knight_columb).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_knight_columb
    @knight_columb = KnightColumb.find_by(id: params[:id])
  end
end
