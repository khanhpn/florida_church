class Admin::LadiesSaintJohnController < Admin::AdminController
  before_action :set_ladies_saint_john, only: [:destroy, :edit, :update, :show]

  def index
    @ladies_saint_johns = LadiesSaintJohn.all
  end

  def new
    @is_main_article = LadiesSaintJohn.find_by(is_main_article: true)
    @ladies_saint_john = LadiesSaintJohn.new
  end

  def show
    @is_main_article = @ladies_saint_john.is_main_article
  end

  def create
    ladies_saint_john = current_user.ladies_saint_johns.new(params_ladies_saint_john)
    if ladies_saint_john.save
      flash[:notice] = 'You created ladies saint johns successfully'
      redirect_to admin_ladies_saint_john_index_path
    else
      flash.now[:warning] = 'You can not create ladies saint johns, please check error'
      render :new
    end
  end

  def update
    if @ladies_saint_john.update(params_ladies_saint_john)
      flash[:notice] = 'You updated children youth successfully'
      redirect_to admin_ladies_saint_john_index_path
    else
      flash.now[:warning] = 'You can not update children youth, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = LadiesSaintJohn.find_by(is_main_article: true)
  end

  def destroy
    @ladies_saint_john.destroy
    flash[:notice] = 'You deleted children youth successfully'
    redirect_to admin_ladies_saint_john_index_path
  end

  private
  def params_ladies_saint_john
    params.require(:ladies_saint_john).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_ladies_saint_john
    @ladies_saint_john = LadiesSaintJohn.find_by(id: params[:id])
  end
end
