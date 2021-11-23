class Admin::UshersHospitalController < Admin::AdminController
  before_action :set_usher_hospital, only: [:destroy, :edit, :update]

  def index
    @usher_hospitals = UshersHospital.all
  end

  def new
    @usher_hospital = UshersHospital.new
  end

  def create
    usher_hospital = current_user.usher_hospitals.new(params_usher_hospital)
    if usher_hospital.save
      flash[:notice] = 'You created usher hospital successfully'
      redirect_to admin_usher_hospital_index_path
    else
      flash.now[:warning] = 'You can not create usher hospital, please check error'
      render :new
    end
  end

  def update
    if @usher_hospital.update(params_usher_hospital)
      flash[:notice] = 'You updated usher hospital successfully'
      redirect_to admin_usher_hospital_index_path
    else
      flash.now[:warning] = 'You can not update usher hospital, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @usher_hospital.destroy
    flash[:notice] = 'You deleted usher hospital successfully'
    redirect_to admin_usher_hospital_index_path
  end

  private
  def params_usher_hospital
    params.require(:usher_hospital).permit(:name, :content, :display_order, :display)
  end

  def set_usher_hospital
    @usher_hospital = UshersHospital.find_by(id: params[:id])
  end
end
