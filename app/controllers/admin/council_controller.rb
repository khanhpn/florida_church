class Admin::CouncilController < Admin::AdminController
  before_action :set_council, only: [:destroy, :edit, :update, :show]

  def index
    @councils = Council.all
  end

  def new
    @is_main_article = Council.find_by(is_main_article: true)
    @council = Council.new
  end

  def show
    @is_main_article = @council.is_main_article
  end

  def create
    council = current_user.councils.new(params_council)
    if council.save
      flash[:notice] = 'You created council successfully'
      redirect_to admin_council_index_path
    else
      flash.now[:warning] = 'You can not create council, please check error'
      render :new
    end
  end

  def update
    if @council.update(params_council)
      flash[:notice] = 'You updated council successfully'
      redirect_to admin_council_index_path
    else
      flash.now[:warning] = 'You can not update council, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Council.find_by(is_main_article: true)
  end

  def destroy
    @council.destroy
    flash[:notice] = 'You deleted council successfully'
    redirect_to admin_council_index_path
  end

  private
  def params_council
    params.require(:council).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_council
    @council = Council.find_by(id: params[:id])
  end
end
