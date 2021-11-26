class Admin::ReconciliationController < Admin::AdminController
  before_action :set_reconciliation, only: [:destroy, :edit, :update]

  def index
    @reconciliations = Reconciliation.all
  end

  def new
    @reconciliation = Reconciliation.new
  end

  def create
    reconciliation = current_user.reconciliations.new(params_reconciliation)
    if reconciliation.save
      flash[:notice] = 'You created reconciliation successfully'
      redirect_to admin_reconciliation_index_path
    else
      flash.now[:warning] = 'You can not create reconciliation, please check error'
      render :new
    end
  end

  def update
    if @reconciliation.update(params_reconciliation)
      flash[:notice] = 'You updated reconciliation successfully'
      redirect_to admin_reconciliation_index_path
    else
      flash.now[:warning] = 'You can not update reconciliation, please check error'
      render :edit
    end
  end

  def edit
  end

  def destroy
    @reconciliation.destroy
    flash[:notice] = 'You deleted reconciliation successfully'
    redirect_to admin_reconciliation_index_path
  end

  private
  def params_reconciliation
    params.require(:reconciliation).permit(:name, :content, :display_order, :display)
  end

  def set_reconciliation
    @reconciliation = Reconciliation.find_by(id: params[:id])
  end
end
