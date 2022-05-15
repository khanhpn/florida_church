class FoodBasketController < ApplicationController
  def index
    @foot_basket = FoodBasket.display_article.last
    @relateds = FoodBasket.where.not(id: @foot_basket)
  end
end
