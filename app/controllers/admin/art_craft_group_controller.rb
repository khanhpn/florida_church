class Admin::ArtCraftGroupController < Admin::AdminController
  before_action :set_art_craft_group, only: [:destroy, :edit, :update, :show]

  def index
    @art_craft_groups = ArtCraftGroup.all
  end

  def new
    @is_main_article = ArtCraftGroup.find_by(is_main_article: true)
    @art_craft_group = ArtCraftGroup.new
  end

  def show
    @is_main_article = @art_craft_group.is_main_article
  end

  def create
    art_craft_group = current_user.art_craft_groups.new(params_art_craft_group)
    if art_craft_group.save
      flash[:notice] = 'You created art craft group successfully'
      redirect_to admin_art_craft_group_index_path
    else
      flash.now[:warning] = 'You can not create art craft group, please check error'
      render :new
    end
  end

  def update
    if @art_craft_group.update(params_art_craft_group)
      flash[:notice] = 'You updated art craft group successfully'
      redirect_to admin_art_craft_group_index_path
    else
      flash.now[:warning] = 'You can not update art craft group, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = ArtCraftGroup.find_by(is_main_article: true)
  end

  def destroy
    @art_craft_group.destroy
    flash[:notice] = 'You deleted art craft group successfully'
    redirect_to admin_art_craft_group_index_path
  end

  private
  def params_art_craft_group
    params.require(:art_craft_group).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_art_craft_group
    @art_craft_group = ArtCraftGroup.find_by(id: params[:id])
  end
end
