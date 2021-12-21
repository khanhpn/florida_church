class Admin::CouncilController < Admin::AdminController
  before_action :set_council, only: [:destroy, :edit, :update]

  def index
    @councils = Council.all
  end

  def new
    @council = Council.new
  end

  def create
    council = current_user.councils.new(params_council)
    if council.save
      flash[:notice] = 'You created council successfully'
      redirect_to admin_council_index_path
    else
      flash.now[:warning] = 'You can not create council, please check error'
      render :new
    end
  end

  def update
    if @council.update(params_council)
      flash[:notice] = 'You updated council successfully'
      redirect_to admin_council_index_path
    else
      flash.now[:warning] = 'You can not update council, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @council.destroy
    flash[:notice] = 'You deleted council successfully'
    redirect_to admin_council_index_path
  end

  private
  def params_council
    params.require(:council).permit(:name, :content, :display_order, :display)
  end

  def set_council
    @council = Council.find_by(id: params[:id])
  end
end
