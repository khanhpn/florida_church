require "test_helper"

class PrayGardenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pray_garden_index_url
    assert_response :success
  end
end
