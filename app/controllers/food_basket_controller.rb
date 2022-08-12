class FoodBasketController < ApplicationController
  def index
    @foot_basket = FoodBasket.display_article.last
    @relateds = FoodBasket.where(display: true, is_main_article: false)
  end
end
