class Admin::ParishEventController < Admin::AdminController
  before_action :set_parish_event, only: [:destroy, :edit, :update, :show]

  def index
    @parish_events = ParishEvent.all
  end

  def new
    @is_main_article = ParishEvent.find_by(is_main_article: true)
    @parish_event = ParishEvent.new
  end

  def show
    @is_main_article = @parish_event.is_main_article
  end

  def create
    parish_event = current_user.parish_events.new(params_parish_event)
    if parish_event.save
      flash[:notice] = 'You created parish events successfully'
      redirect_to admin_parish_event_index_path
    else
      flash.now[:warning] = 'You can not create parish events, please check error'
      render :new
    end
  end

  def update
    if @parish_event.update(params_parish_event)
      flash[:notice] = 'You updated children youth successfully'
      redirect_to admin_parish_event_index_path
    else
      flash.now[:warning] = 'You can not update children youth, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = ParishEvent.find_by(is_main_article: true)
  end

  def destroy
    @parish_event.destroy
    flash[:notice] = 'You deleted children youth successfully'
    redirect_to admin_parish_event_index_path
  end

  private
  def params_parish_event
    params.require(:parish_event).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_parish_event
    @parish_event = ParishEvent.find_by(id: params[:id])
  end
end
