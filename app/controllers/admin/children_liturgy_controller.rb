class Admin::ChildrenLiturgyController < Admin::AdminController
  before_action :set_children_liturgy, only: [:destroy, :edit, :update]

  def index
    @children_liturgies = ChildrensLiturgy.all
  end

  def new
    @children_liturgy = ChildrensLiturgy.new
  end

  def create
    children_liturgy = current_user.children_liturgies.new(params_children_liturgy)
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
  end

  def destroy
    @children_liturgy.destroy
    flash[:notice] = 'You deleted children liturgy successfully'
    redirect_to admin_children_liturgy_index_path
  end

  private
  def params_children_liturgy
    params.require(:children_liturgy).permit(:name, :content, :display_order, :display)
  end

  def set_children_liturgy
    @children_liturgy = ChildrensLiturgy.find_by(id: params[:id])
  end
end
