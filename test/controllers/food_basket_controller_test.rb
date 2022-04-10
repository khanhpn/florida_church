require "test_helper"

class FoodBasketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_basket_index_url
    assert_response :success
  end
end
