class Admin::BaptismController < Admin::AdminController
  before_action :set_baptism, only: [:destroy, :edit, :update, :show]

  def index
    @baptisms = Baptism.all
  end

  def new
    @is_main_article = Baptism.find_by(is_main_article: true)
    @baptism = Baptism.new
  end

  def show
    @is_main_article = @baptism.is_main_article
  end

  def create
    baptism = current_user.baptisms.new(params_baptism)
    if baptism.save
      flash[:notice] = 'You created baptism successfully'
      redirect_to admin_baptism_index_path
    else
      flash.now[:warning] = 'You can not create baptism, please check error'
      render :new
    end
  end

  def update
    if @baptism.update(params_baptism)
      flash[:notice] = 'You updated baptism successfully'
      redirect_to admin_baptism_index_path
    else
      flash.now[:warning] = 'You can not update baptism, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = @baptism.is_main_article
  end

  def destroy
    @baptism.destroy
    flash[:notice] = 'You deleted baptism successfully'
    redirect_to admin_baptism_index_path
  end

  private
  def params_baptism
    params.require(:baptism).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_baptism
    @baptism = Baptism.find_by(id: params[:id])
  end
end
