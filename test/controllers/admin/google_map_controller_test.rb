require "test_helper"

class Admin::GoogleMapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_google_map_index_url
    assert_response :success
  end
end
