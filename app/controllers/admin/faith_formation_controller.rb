class Admin::FaithFormationController < Admin::AdminController
  before_action :set_faith_formation, only: [:destroy, :edit, :update, :show]

  def index
    @faith_formations = FaithFormation.all
  end

  def new
    @is_main_article = FaithFormation.find_by(is_main_article: true)
    @faith_formation = FaithFormation.new
  end

  def show
    @is_main_article = @faith_formation.is_main_article
  end

  def create
    faith_formation = current_user.faith_formations.new(params_faith_formation)
    if faith_formation.save
      flash[:notice] = 'You created faith formations successfully'
      redirect_to admin_faith_formation_index_path
    else
      flash.now[:warning] = 'You can not create faith formations, please check error'
      render :new
    end
  end

  def update
    if @faith_formation.update(params_faith_formation)
      flash[:notice] = 'You updated children youth successfully'
      redirect_to admin_faith_formation_index_path
    else
      flash.now[:warning] = 'You can not update children youth, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = FaithFormation.find_by(is_main_article: true)
  end

  def destroy
    @faith_formation.destroy
    flash[:notice] = 'You deleted children youth successfully'
    redirect_to admin_faith_formation_index_path
  end

  private
  def params_faith_formation
    params.require(:faith_formation).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_faith_formation
    @faith_formation = FaithFormation.find_by(id: params[:id])
  end
end
