class Admin::StaffController < Admin::AdminController
  before_action :set_staff, only: [:destroy, :edit, :update]

  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
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
  end

  def destroy
    @staff.destroy
    flash[:notice] = 'You deleted staff successfully'
    redirect_to admin_staff_index_path
  end

  private
  def params_staff
    params.require(:staff).permit(:name, :content, :display_order, :display)
  end

  def set_staff
    @staff = Staff.find_by(id: params[:id])
  end
end
