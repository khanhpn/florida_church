class Admin::StaffController < Admin::AdminController
  before_action :set_youth, only: [:destroy, :edit, :update, :show]

  def index
    @staffs = Staff.all
  end

  def new
    @is_main_article = Staff.find_by(is_main_article: true)
    @staff = Staff.new
  end

  def show
    @is_main_article = @staff.is_main_article
  end

  def create
    staff = current_user.staffs.new(params_staff)
    if staff.save
      flash[:notice] = 'You created staff successfully'
      redirect_to admin_staff_index_path
    else
      flash.now[:warning] = 'You can not create staff, please check error'
      render :new
    end
  end

  def update
    if @staff.update(params_staff)
      flash[:notice] = 'You updated staff successfully'
      redirect_to admin_staff_index_path
    else
      flash.now[:warning] = 'You can not update staff, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = Staff.find_by(is_main_article: true)
  end

  def destroy
    @staff.destroy
    flash[:notice] = 'You deleted staff successfully'
    redirect_to admin_staff_index_path
  end

  private
  def params_staff
    params.require(:staff).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_staff
    @staff = Staff.find_by(id: params[:id])
  end
end
