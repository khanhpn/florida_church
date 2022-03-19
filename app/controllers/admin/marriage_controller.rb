class Admin::MarriageController < Admin::AdminController
  before_action :set_marriage, only: [:destroy, :edit, :update, :show]

  def index
    @marriages = Marriage.all
  end

  def new
    @is_main_article = Marriage.find_by(is_main_article: true)
    @marriage = Marriage.new
  end

  def show
    @is_main_article = @marriage.is_main_article
  end

  def create
    marriage = current_user.marriages.new(params_marriage)
    if marriage.save
      flash[:notice] = 'You created marriage successfully'
      redirect_to admin_marriage_index_path
    else
      flash.now[:warning] = 'You can not create marriage, please check error'
      render :new
    end
  end

  def update
    if @marriage.update(params_marriage)
      flash[:notice] = 'You updated marriage successfully'
      redirect_to admin_marriage_index_path
    else
      flash.now[:warning] = 'You can not update marriage, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Marriage.find_by(is_main_article: true)
  end

  def destroy
    @marriage.destroy
    flash[:notice] = 'You deleted marriage successfully'
    redirect_to admin_marriage_index_path
  end

  private
  def params_marriage
    params.require(:marriage).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_marriage
    @marriage = Marriage.find_by(id: params[:id])
  end
end
