class Admin::SpecialNotesController < Admin::AdminController
  before_action :set_special_note, only: [:destroy, :edit, :update]

  def index
    @special_note = SpecialNote.last
  end

  def new
    @special_note = SpecialNote.new
  end

  def create
    special_note = current_user.special_notes.new(params_special_note)
    if special_note.save
      flash[:notice] = 'You created special note successfully'
      redirect_to admin_special_notes_path
    else
      flash.now[:warning] = 'You can not create special note, please check error'
      render :new
    end
  end

  def update
    if @special_note.update(params_special_note)
      flash[:notice] = 'You updated special note successfully'
      redirect_to admin_special_notes_path
    else
      flash.now[:warning] = 'You can not update special note, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @special_note.destroy
    flash[:notice] = 'You deleted special note successfully'
    redirect_to admin_special_notes_path
  end

  private
  def params_special_note
    params.require(:special_note).permit(:name, :content)
  end

  def set_special_note
    @special_note = SpecialNote.find_by(id: params[:id])
  end
end
