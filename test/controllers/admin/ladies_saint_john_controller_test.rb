require "test_helper"

class Admin::LadiesSaintJohnControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ladies_saint_john_index_url
    assert_response :success
  end
end
