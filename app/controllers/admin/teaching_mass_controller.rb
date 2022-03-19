class Admin::TeachingMassController < Admin::AdminController
  before_action :set_teaching_mass, only: [:destroy, :edit, :update, :show]

  def index
    @teaching_masses = TeachingMass.all
  end

  def new
    @is_main_article = TeachingMass.find_by(is_main_article: true)
    @teaching_mass = TeachingMass.new
  end

  def show
    @is_main_article = @teaching_mass.is_main_article
  end

  def create
    teaching_mass = current_user.teaching_masses.new(params_teaching_mass)
    if teaching_mass.save
      flash[:notice] = 'You created teaching mass successfully'
      redirect_to admin_teaching_mass_index_path
    else
      flash.now[:warning] = 'You can not create teaching mass, please check error'
      render :new
    end
  end

  def update
    if @teaching_mass.update(params_teaching_mass)
      flash[:notice] = 'You updated teaching mass successfully'
      redirect_to admin_teaching_mass_index_path
    else
      flash.now[:warning] = 'You can not update teaching mass, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = TeachingMass.find_by(is_main_article: true)
  end

  def destroy
    @teaching_mass.destroy
    flash[:notice] = 'You deleted teaching mass successfully'
    redirect_to admin_teaching_mass_index_path
  end

  private
  def params_teaching_mass
    params.require(:teaching_mass).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_teaching_mass
    @teaching_mass = TeachingMass.find_by(id: params[:id])
  end
end
