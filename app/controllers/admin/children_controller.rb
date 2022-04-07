class Admin::ChildrenController < Admin::AdminController
  before_action :set_children, only: [:destroy, :edit, :update, :show]

  def index
    @childrens = Child.all
  end

  def new
    @is_main_article = Child.find_by(is_main_article: true)
    @children = Child.new
  end

  def show
    @is_main_article = @children.is_main_article
  end

  def create
    children = current_user.childs.new(params_children)
    if children.save
      flash[:notice] = 'You created children successfully'
      redirect_to admin_children_path
    else
      flash.now[:warning] = 'You can not create children, please check error'
      render :new
    end
  end

  def update
    if @children.update(params_children)
      flash[:notice] = 'You updated children successfully'
      redirect_to admin_children_path
    else
      flash.now[:warning] = 'You can not update children, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Child.find_by(is_main_article: true)
  end

  def destroy
    @children.destroy
    flash[:notice] = 'You deleted children successfully'
    redirect_to admin_children_path
  end

  private
  def params_children
    params.require(:child).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_children
    @children = Child.find_by(id: params[:id])
  end
end
