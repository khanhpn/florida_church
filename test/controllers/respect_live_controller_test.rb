require "test_helper"

class RespectLiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get respect_live_index_url
    assert_response :success
  end
end
