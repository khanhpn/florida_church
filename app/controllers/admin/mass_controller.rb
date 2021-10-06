class Admin::MassController < Admin::AdminController
  before_action :set_mass, only: [:show, :destroy, :edit, :update]

  def index
    @masses = Mass.normal_mass
    @ticked_mass = Mass.ticked_mass.first
  end

  def new
    @mass = Mass.new
  end

  def create
    mass = current_user.masses.new(params_mass)
    if mass.save
      flash[:notice] = 'You created mass successfully'
      redirect_to admin_mass_index_path
    else
      flash.now[:warning] = 'You can not create mass, please check error'
      render :new
    end
  end

  def update
    if @mass.update(params_mass)
      byebug
      flash[:notice] = 'You updated mass successfully'
      redirect_to admin_mass_index_path
    else
      flash.now[:warning] = 'You can not update mass, please check error'
      render :edit
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @mass.destroy
    flash[:notice] = 'You deleted mass successfully'
    redirect_to admin_mass_index_path
  end

  private
  def params_mass
    params.require(:mass).permit(:name, :content, :ticked, :file_attached)
  end

  def set_mass
    @mass = Mass.find_by(id: params[:id])
  end
end
