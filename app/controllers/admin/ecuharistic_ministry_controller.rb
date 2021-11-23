class Admin::EcuharisticMinistryController < Admin::AdminController
  before_action :set_ecuharistic_ministry, only: [:destroy, :edit, :update]

  def index
    @ecuharistic_ministries = EcuharisticMinistry.all
  end

  def new
    @ecuharistic_ministry = EcuharisticMinistry.new
  end

  def create
    ecuharistic_ministry = current_user.ecuharistic_ministries.new(params_ecuharistic_ministry)
    if ecuharistic_ministry.save
      flash[:notice] = 'You created ecuharistic ministry successfully'
      redirect_to admin_ecuharistic_ministry_index_path
    else
      flash.now[:warning] = 'You can not create ecuharistic ministry, please check error'
      render :new
    end
  end

  def update
    if @ecuharistic_ministry.update(params_ecuharistic_ministry)
      flash[:notice] = 'You updated ecuharistic ministry successfully'
      redirect_to admin_ecuharistic_ministry_index_path
    else
      flash.now[:warning] = 'You can not update ecuharistic ministry, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @ecuharistic_ministry.destroy
    flash[:notice] = 'You deleted ecuharistic ministry successfully'
    redirect_to admin_ecuharistic_ministry_index_path
  end

  private
  def params_ecuharistic_ministry
    params.require(:ecuharistic_ministry).permit(:name, :content, :display_order, :display)
  end

  def set_ecuharistic_ministry
    @ecuharistic_ministry = EcuharisticMinistry.find_by(id: params[:id])
  end
end
