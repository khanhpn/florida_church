require "test_helper"

class Admin::PrayGardenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pray_garden_index_url
    assert_response :success
  end
end
