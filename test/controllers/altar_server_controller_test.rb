require "test_helper"

class AltarServerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get altar_server_index_url
    assert_response :success
  end
end
