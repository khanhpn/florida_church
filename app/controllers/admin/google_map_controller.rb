class Admin::GoogleMapController < Admin::AdminController
  before_action :set_google_map, only: [:destroy, :edit, :update]

  def index
    @google_map = Geography.last
  end

  def new
    @google_map = Geography.new
  end

  def create
    google_map = Geography.new(params_google_map)
    if google_map.save
      flash[:notice] = 'You created google_map successfully'
      redirect_to admin_google_map_index_path
    else
      flash.now[:warning] = 'You can not create google_map, please check error'
      render :new
    end
  end

  def update
    if @google_map.update(params_google_map)
      flash[:notice] = 'You updated google_map successfully'
      redirect_to admin_google_map_index_path
    else
      flash.now[:warning] = 'You can not update google_map, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @google_map.destroy
    flash[:notice] = 'You deleted google_map successfully'
    redirect_to admin_google_map_index_path
  end

  private
  def params_google_map
    params.require(:google_map).permit(:lat, :lng)
  end

  def set_google_map
    @google_map = Geography.find_by(id: params[:id])
  end
end
