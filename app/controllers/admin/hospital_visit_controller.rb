class Admin::HospitalVisitController < Admin::AdminController
  before_action :set_hospital_visit, only: [:destroy, :edit, :update, :show]

  def index
    @hospital_visits = HospitalVisit.all
  end

  def new
    @is_main_article = HospitalVisit.find_by(is_main_article: true)
    @hospital_visit = HospitalVisit.new
  end

  def show
    @is_main_article = @hospital_visit.is_main_article
  end

  def create
    hospital_visit = current_user.hospital_visits.new(params_hospital_visit)
    if hospital_visit.save
      flash[:notice] = 'You created hospital_visit successfully'
      redirect_to admin_hospital_visit_index_path
    else
      flash.now[:warning] = 'You can not create hospital visit, please check error'
      render :new
    end
  end

  def update
    if @hospital_visit.update(params_hospital_visit)
      flash[:notice] = 'You updated hospital visit successfully'
      redirect_to admin_hospital_visit_index_path
    else
      flash.now[:warning] = 'You can not update hospital visit, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = HospitalVisit.find_by(is_main_article: true)
  end

  def destroy
    @hospital_visit.destroy
    flash[:notice] = 'You deleted hospital visit successfully'
    redirect_to admin_hospital_visit_index_path
  end

  private
  def params_hospital_visit
    params.require(:hospital_visit).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_hospital_visit
    @hospital_visit = HospitalVisit.find_by(id: params[:id])
  end
end
