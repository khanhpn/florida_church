require "test_helper"

class Admin::HolyordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_holyorders_index_url
    assert_response :success
  end
end
