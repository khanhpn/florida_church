class Admin::UshersHospitalController < Admin::AdminController
  before_action :set_usher_hospital, only: [:destroy, :edit, :update, :show]

  def index
    @usher_hospitals = UshersHospitality.all
  end

  def new
    @is_main_article = UshersHospitality.find_by(is_main_article: true)
    @usher_hospital = UshersHospitality.new
  end

  def show
    @is_main_article = @usher_hospital.is_main_article
  end

  def create
    usher_hospital = current_user.ushers_hospitalities.new(params_usher_hospital)
    if usher_hospital.save
      flash[:notice] = 'You created usher hospital successfully'
      redirect_to admin_ushers_hospital_index_path
    else
      flash.now[:warning] = 'You can not create usher hospital, please check error'
      render :new
    end
  end

  def update
    if @usher_hospital.update(params_usher_hospital)
      flash[:notice] = 'You updated usher hospital successfully'
      redirect_to admin_ushers_hospital_index_path
    else
      flash.now[:warning] = 'You can not update usher hospital, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = @usher_hospital.is_main_article
  end

  def destroy
    @usher_hospital.destroy
    flash[:notice] = 'You deleted usher hospital successfully'
    redirect_to admin_ushers_hospital_index_path
  end

  private
  def params_usher_hospital
    params.require(:ushers_hospitality).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf)
  end

  def set_usher_hospital
    @usher_hospital = UshersHospitality.find_by(id: params[:id])
  end
end
