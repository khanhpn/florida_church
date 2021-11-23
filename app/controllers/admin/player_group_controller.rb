class Admin::PlayerGroupController < Admin::AdminController
  before_action :set_player_group, only: [:destroy, :edit, :update]

  def index
    @player_groups = PrayerGroup.all
  end

  def new
    @player_group = PrayerGroup.new
  end

  def create
    player_group = current_user.prayer_groups.new(params_player_group)
    if player_group.save
      flash[:notice] = 'You created player group successfully'
      redirect_to admin_player_group_index_path
    else
      flash.now[:warning] = 'You can not create player group, please check error'
      render :new
    end
  end

  def update
    if @player_group.update(params_player_group)
      flash[:notice] = 'You updated player group successfully'
      redirect_to admin_player_group_index_path
    else
      flash.now[:warning] = 'You can not update player group, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @player_group.destroy
    flash[:notice] = 'You deleted player group successfully'
    redirect_to admin_player_group_index_path
  end

  private
  def params_player_group
    params.require(:prayer_group).permit(:name, :content, :display_order, :display)
  end

  def set_player_group
    @player_group = PrayerGroup.find_by(id: params[:id])
  end
end
