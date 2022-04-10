require "test_helper"

class Admin::RespectLiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_respect_live_index_url
    assert_response :success
  end
end
