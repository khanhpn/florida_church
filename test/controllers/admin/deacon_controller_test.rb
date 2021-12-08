require "test_helper"

class Admin::DeaconControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_deacon_index_url
    assert_response :success
  end
end
