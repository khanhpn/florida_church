class Admin::PlannedGivingController < Admin::AdminController
  before_action :set_planned_giving, only: [:destroy, :edit, :update, :show]

  def index
    @planned_givings = PlannedGiving.all
  end

  def new
    @is_main_article = PlannedGiving.find_by(is_main_article: true)
    @planned_giving = PlannedGiving.new
  end

  def show
    @is_main_article = @planned_giving.is_main_article
  end

  def create
    planned_giving = current_user.planned_givings.new(params_planned_giving)
    if planned_giving.save
      flash[:notice] = 'You created planned giving successfully'
      redirect_to admin_planned_giving_index_path
    else
      flash.now[:warning] = 'You can not create planned giving, please check error'
      render :new
    end
  end

  def update
    if @planned_giving.update(params_planned_giving)
      flash[:notice] = 'You updated planned giving successfully'
      redirect_to admin_planned_giving_index_path
    else
      flash.now[:warning] = 'You can not update planned giving, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = PlannedGiving.find_by(is_main_article: true)
  end

  def destroy
    @planned_giving.destroy
    flash[:notice] = 'You deleted planned giving successfully'
    redirect_to admin_planned_giving_index_path
  end

  private
  def params_planned_giving
    params.require(:planned_giving).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_planned_giving
    @planned_giving = PlannedGiving.find_by(id: params[:id])
  end
end
