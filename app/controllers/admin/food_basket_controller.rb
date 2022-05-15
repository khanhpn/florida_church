class Admin::FoodBasketController < Admin::AdminController
  before_action :set_food_basket, only: [:destroy, :edit, :update, :show]

  def index
    @food_baskets = FoodBasket.all
  end

  def new
    @is_main_article = FoodBasket.find_by(is_main_article: true)
    @food_basket = FoodBasket.new
  end

  def show
    @is_main_article = @food_basket.is_main_article
  end

  def create
    food_basket = current_user.food_baskets.new(params_food_basket)
    if food_basket.save
      flash[:notice] = 'You created foot basket successfully'
      redirect_to admin_food_basket_index_path
    else
      flash.now[:warning] = 'You can not create foot basket, please check error'
      render :new
    end
  end

  def update
    if @food_basket.update(params_food_basket)
      flash[:notice] = 'You updated foot basket successfully'
      redirect_to admin_food_basket_index_path
    else
      flash.now[:warning] = 'You can not update foot basket, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = FoodBasket.find_by(is_main_article: true)
  end

  def destroy
    @food_basket.destroy
    flash[:notice] = 'You deleted foot basket successfully'
    redirect_to admin_food_basket_index_path
  end

  private
  def params_food_basket
    params.require(:food_basket).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_food_basket
    @food_basket = FoodBasket.find_by(id: params[:id])
  end
end
