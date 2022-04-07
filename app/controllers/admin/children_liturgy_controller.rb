class Admin::ChildrenLiturgyController < Admin::AdminController
  before_action :set_children_liturgy, only: [:destroy, :edit, :update, :show]

  def index
    @children_liturgies = ChildrensLiturgy.all
  end

  def new
    @is_main_article = ChildrensLiturgy.find_by(is_main_article: true)
    @children_liturgy = ChildrensLiturgy.new
  end

  def show
    @is_main_article = @children_liturgy.is_main_article
  end

  def create
    children_liturgy = current_user.childrens_liturgies.new(params_children_liturgy)
    if children_liturgy.save
      flash[:notice] = 'You created children liturgy successfully'
      redirect_to admin_children_liturgy_index_path
    else
      flash.now[:warning] = 'You can not create children liturgy, please check error'
      render :new
    end
  end

  def update
    if @children_liturgy.update(params_children_liturgy)
      flash[:notice] = 'You updated children liturgy successfully'
      redirect_to admin_children_liturgy_index_path
    else
      flash.now[:warning] = 'You can not update children liturgy, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = ChildrensLiturgy.find_by(is_main_article: true)
  end

  def destroy
    @children_liturgy.destroy
    flash[:notice] = 'You deleted children liturgy successfully'
    redirect_to admin_children_liturgy_index_path
  end

  private
  def params_children_liturgy
    params.require(:childrens_liturgy).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_children_liturgy
    @children_liturgy = ChildrensLiturgy.find_by(id: params[:id])
  end
end
