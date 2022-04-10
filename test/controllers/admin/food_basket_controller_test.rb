require "test_helper"

class Admin::FoodBasketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_food_basket_index_url
    assert_response :success
  end
end
