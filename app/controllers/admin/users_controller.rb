class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def create
  end

  def update
    if @user.update(params_user)

    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find_by(id: params[:id])
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
