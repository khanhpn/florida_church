require "test_helper"

class HolyordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get holyorders_index_url
    assert_response :success
  end
end
