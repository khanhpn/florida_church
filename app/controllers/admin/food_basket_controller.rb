class Admin::FoodBasketController < Admin::AdminController
  before_action :set_foot_basket, only: [:destroy, :edit, :update, :show]

  def index
    @food_baskets = FoodBasket.all
  end

  def new
    @is_main_article = FoodBasket.find_by(is_main_article: true)
    @foot_basket = FoodBasket.new
  end

  def show
    @is_main_article = @foot_basket.is_main_article
  end

  def create
    foot_basket = current_user.food_baskets.new(params_foot_basket)
    if foot_basket.save
      flash[:notice] = 'You created foot basket successfully'
      redirect_to admin_foot_basket_index_path
    else
      flash.now[:warning] = 'You can not create foot basket, please check error'
      render :new
    end
  end

  def update
    if @foot_basket.update(params_foot_basket)
      flash[:notice] = 'You updated foot basket successfully'
      redirect_to admin_foot_basket_index_path
    else
      flash.now[:warning] = 'You can not update foot basket, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = FoodBasket.find_by(is_main_article: true)
  end

  def destroy
    @foot_basket.destroy
    flash[:notice] = 'You deleted foot basket successfully'
    redirect_to admin_foot_basket_index_path
  end

  private
  def params_foot_basket
    params.require(:foot_basket).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_foot_basket
    @foot_basket = FoodBasket.find_by(id: params[:id])
  end
end
