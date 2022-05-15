require "test_helper"

class DeaconControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deacon_index_url
    assert_response :success
  end
end
