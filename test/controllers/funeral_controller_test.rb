require "test_helper"

class FuneralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get funeral_index_url
    assert_response :success
  end
end
