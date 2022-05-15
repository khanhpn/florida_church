require "test_helper"

class LadiesSaintJohnControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ladies_saint_john_index_url
    assert_response :success
  end
end
