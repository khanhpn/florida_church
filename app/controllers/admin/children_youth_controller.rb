class Admin::ChildrenYouthController < Admin::AdminController
  before_action :set_children_youth, only: [:destroy, :edit, :update, :show]

  def index
    @children_youths = ChildrenYouth.all
  end

  def new
    @is_main_article = ChildrenYouth.find_by(is_main_article: true)
    @children_youth = ChildrenYouth.new
  end

  def show
    @is_main_article = @children_youth.is_main_article
  end

  def create
    children_youth = current_user.children_youths.new(params_children_youth)
    if children_youth.save
      flash[:notice] = 'You created children youth successfully'
      redirect_to admin_children_youth_index_path
    else
      flash.now[:warning] = 'You can not create children youth, please check error'
      render :new
    end
  end

  def update
    if @children_youth.update(params_children_youth)
      flash[:notice] = 'You updated children youth successfully'
      redirect_to admin_children_youth_index_path
    else
      flash.now[:warning] = 'You can not update children youth, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = ChildrenYouth.find_by(is_main_article: true)
  end

  def destroy
    @children_youth.destroy
    flash[:notice] = 'You deleted children youth successfully'
    redirect_to admin_children_youth_index_path
  end

  private
  def params_children_youth
    params.require(:children_youth).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_children_youth
    @children_youth = ChildrenYouth.find_by(id: params[:id])
  end
end
