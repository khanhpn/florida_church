class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :check_permission_admin?

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def show
  end

  def create
    params_user[:user_type] = params_user[:user_type].to_i
    user = User.new(params_user)
    if user.save
      redirect_to admin_user_path(user)
    else
      render :new
    end
  end

  def update
    is_password = params_user.dig(:password).blank? || params_user.dig[:password_confirmation].blank?
    if is_password
      params_user.delete(:password)
      params_user.delete(:password_confirmation)
    end

    params_user[:user_type] = params_user[:user_type].to_i
    if @user.update(params_user)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find_by(id: params[:id])
  end

  def params_user
    @params_user ||= params.require(:user).permit(:first_name, :last_name, :email, :year_old, :sex, :country, :address, :user_type, :password, :password_confirmation, :logo_icon)
  end
end
